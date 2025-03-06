import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quectochat/domain/interfaces/i_api_facade.dart';
import 'package:quectochat/domain/models/user_details.dart';

import '../../domain/models/interlocutor.dart';
import '../../domain/models/message.dart';
import '../../domain/models/message_content_type.dart';
import '../../domain/models/network_exceptions.dart';
import '../../domain/models/paginated.dart';
import '../../domain/utils/id_tools/id_tools.dart';

part 'keys.dart';

part 'mapper.dart';

final class FirebaseService implements INetworkFacade {
  FirebaseService() {
    _firebaseAuth = FirebaseAuth.instance;
    _firebaseFirestore = FirebaseFirestore.instance;
    _mapper = _Mapper();
  }

  // ОКРУЖЕНИЕ:
  // ---------------------------------------------------------------------------
  late final FirebaseAuth _firebaseAuth;
  late final FirebaseFirestore _firebaseFirestore;
  late final _Mapper _mapper;

  // ВСПОМОГАТЕЛЬНЫЕ ДАННЫЕ:
  // ---------------------------------------------------------------------------
  /// ID текущего пользователя
  String _currentUserId = '';

  /// Лимиты пагинации
  static const _messagesPaginationLimit = 20;
  static const _interlocutorsPaginationLimit = 20;

  // ГЕТТЕРЫ:
  // ---------------------------------------------------------------------------
  /// Возвращает ID текущего пользователя
  @override
  String get currentUserId => _currentUserId;

  // АВТРИЗАЦИЯ:
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  /// Проверка залогиненности пользователя
  @override
  bool checkAuth() {
    final isAuthed = _firebaseAuth.currentUser != null;
    _currentUserId = _firebaseAuth.currentUser?.uid ?? '';
    return isAuthed;
  }

  // ---------------------------------------------------------------------------
  /// Логин пользователя
  @override
  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final credentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _currentUserId = credentials.user?.uid ?? '';
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-credential':
          throw LoginInvalidCredential();
        case 'user-not-found':
          throw LoginUserNotFound();
        case 'wrong-password':
          throw LoginUserWrongPassword();
        default:
          rethrow;
      }
    } on Object {
      rethrow;
    }
  }

  // ---------------------------------------------------------------------------
  /// Регистрация пользователя
  @override
  Future<void> registration({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userId = credentials.user?.uid;
      if (userId == null) {
        Error.throwWithStackTrace('Registration failed', StackTrace.current);
      }

      final userDoc = _firebaseFirestore.collection(_Keys._tUsers).doc(userId);
      final userSnapshot = await userDoc.get();

      // Если документа нет, создаем новый
      if (!userSnapshot.exists) {
        await userDoc.set({
          _Keys._fUser$fullName: '$firstName $lastName',
          _Keys._fUser$createdAt: '${DateTime.now()}',
        });
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          throw RegistrationWeakPassword();
        case 'email-already-in-use':
          throw RegistrationEmailAlreadyUsed();
        default:
          rethrow;
      }
    } on Object {
      rethrow;
    }
  }

  // ---------------------------------------------------------------------------
  /// Разлогин пользователя
  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
    _currentUserId = '';
  }

  // СОБЕСЕДНИКИ:
  // ---------------------------------------------------------------------------
  @override
  Future<Paginated<Interlocutor>> getInterlocutors({
    String? lastInterlocutorId,
    String? search,
  }) async {
    const limit = _interlocutorsPaginationLimit;
    DocumentSnapshot<Map<String, dynamic>>? lastDocument;

    if (lastInterlocutorId != null) {
      final lastDocSnapshot = await _firebaseFirestore
          .collection(_Keys._tUsers)
          .doc(lastInterlocutorId)
          .get();

      if (lastDocSnapshot.exists) {
        lastDocument = lastDocSnapshot;
      }
    }

    // 1. Загружаем последние сообщения, упорядоченные по времени
    final lastMessagesQuery = await _firebaseFirestore
        .collection(_Keys._tMessages)
        .where(_Keys._fMessage$fromId, isEqualTo: _currentUserId)
        .orderBy(_Keys._fMessage$timestamp, descending: true)
        .limit(limit + 1)
        .get();

    final Set<String> interlocutorIdsWithMessages = {};
    final Map<String, QueryDocumentSnapshot<Map<String, dynamic>>>
        lastMessages = {};

    for (var doc in lastMessagesQuery.docs) {
      final fromId = doc[_Keys._fMessage$fromId] as String;
      final toId = doc[_Keys._fMessage$toId] as String;
      final interlocutorId = fromId == _currentUserId ? toId : fromId;

      if (!interlocutorIdsWithMessages.contains(interlocutorId)) {
        interlocutorIdsWithMessages.add(interlocutorId);
        lastMessages[interlocutorId] = doc;
      }
    }

    // 2. Загружаем пользователей, у которых есть сообщения
    final usersWithMessagesQuery = await _firebaseFirestore
        .collection(_Keys._tUsers)
        .where(FieldPath.documentId,
            whereIn: interlocutorIdsWithMessages.toList())
        .get();

    final List<Interlocutor> withMessages =
        usersWithMessagesQuery.docs.map((doc) {
      final data = doc.data();
      final userId = doc.id;
      final lastMessageDoc = lastMessages[userId];
      final lastMessageData = lastMessageDoc?.data();

      return Interlocutor(
        userId: userId,
        firstName: (data[_Keys._fUser$fullName] as String).split(' ').first,
        lastName: (data[_Keys._fUser$fullName]).split(' ').skip(1).join(' '),
        lastSentContent: lastMessageData?[_Keys._fMessage$content] as String?,
        lastSentContentType: _mapChatMessageTypeReverse(
            lastMessageData?[_Keys._fMessage$type] as String?),
        lastSentAt: lastMessageData?[_Keys._fMessage$timestamp] != null
            ? DateTime.fromMicrosecondsSinceEpoch(
                lastMessageData![_Keys._fMessage$timestamp] as int)
            : null,
        isSentByYou: lastMessageData?[_Keys._fMessage$fromId] == _currentUserId,
      );
    }).toList();

    // 3. Загружаем оставшихся пользователей (без сообщений), исключая тех, у кого они есть
    Query<Map<String, dynamic>> query = _firebaseFirestore
        .collection(_Keys._tUsers)
        .orderBy(_Keys._fUser$fullName)
        .limit(limit + 1);

    if (search != null && search.isNotEmpty) {
      final lowerSearch = search.toLowerCase();
      query = query.where(
        _Keys._fUser$fullName,
        isGreaterThanOrEqualTo: lowerSearch,
        isLessThan: '$lowerSearch\uf8ff',
      );
    }

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    final response = await query.get();
    final withoutMessages = response.docs
        .where((doc) => !interlocutorIdsWithMessages.contains(doc.id))
        .map((doc) {
      final data = doc.data();
      return Interlocutor(
        userId: doc.id,
        firstName: (data[_Keys._fUser$fullName] as String).split(' ').first,
        lastName: (data[_Keys._fUser$fullName]).split(' ').skip(1).join(' '),
        lastSentContent: null,
        lastSentContentType: null,
        lastSentAt: null,
        isSentByYou: false,
      );
    }).toList();

    // 4. Объединяем два списка
    final sortedUsers = [...withMessages, ...withoutMessages];
    final hasNext = sortedUsers.length > limit;

    return Paginated<Interlocutor>(
      hasNext: hasNext,
      result: hasNext ? sortedUsers.sublist(0, limit) : sortedUsers,
    );
  }

  /// Метод для обратного маппинга типа сообщения
  MessageContentType? _mapChatMessageTypeReverse(String? type) {
    switch (type) {
      case 'text':
        return MessageContentType.text;
      case 'image':
        return MessageContentType.image;
      default:
        return null;
    }
  }

  // ---------------------------------------------------------------------------
  @override
  Stream<Set<Interlocutor>> getActualInterlocutors() {
    return _firebaseFirestore
        .collection(_Keys._tMessages)
        .where(
          Filter.or(
            Filter(_Keys._fMessage$fromId, isEqualTo: _currentUserId),
            Filter(_Keys._fMessage$toId, isEqualTo: _currentUserId),
          ),
        )
        .orderBy(_Keys._fMessage$timestamp, descending: true)
        .snapshots()
        .asyncMap((snapshot) async {
      final interlocutors = <String, Interlocutor>{};

      for (var doc in snapshot.docs) {
        final data = doc.data();
        final fromId = data[_Keys._fMessage$fromId] as String;
        final toId = data[_Keys._fMessage$toId] as String;
        final messageContent = data[_Keys._fMessage$content] as String?;
        final messageType =
            _mapChatMessageTypeReverse(data[_Keys._fMessage$type] as String?);
        final timestamp = data[_Keys._fMessage$timestamp] as int?;

        final interlocutorId = fromId == _currentUserId ? toId : fromId;
        if (interlocutors.containsKey(interlocutorId)) {
          continue; // Уже добавлен более свежее сообщение
        }

        final userDoc = await _firebaseFirestore
            .collection(_Keys._tUsers)
            .doc(interlocutorId)
            .get();

        if (!userDoc.exists) continue;

        final userData = userDoc.data()!;
        final fullName = userData[_Keys._fUser$fullName] as String;
        final nameParts = fullName.split(' ');
        final firstName = nameParts.first;
        final lastName = nameParts.skip(1).join(' ');

        interlocutors[interlocutorId] = Interlocutor(
          userId: interlocutorId,
          firstName: firstName,
          lastName: lastName,
          lastSentContent: messageContent,
          lastSentContentType: messageType,
          lastSentAt: timestamp != null
              ? DateTime.fromMicrosecondsSinceEpoch(timestamp)
              : null,
          isSentByYou: fromId == _currentUserId,
        );
      }

      return interlocutors.values.toSet();
    });
  }

  // ---------------------------------------------------------------------------
  @override
  Future<void> clearChat({required String interlocutorId}) async {
    final chatId = IdTools.getChatId([_currentUserId, interlocutorId]);
    final messagesQuery = await _firebaseFirestore
        .collection(_Keys._tMessages)
        .where(_Keys._fMessage$chatId, isEqualTo: chatId)
        .get();

    for (var doc in messagesQuery.docs) {
      await doc.reference.delete();
    }
  }

  // СООБЩЕНИЯ:
  // ---------------------------------------------------------------------------
  @override
  Future<Paginated<Message>> getChatMessages({
    required Set<String> interlocutorsIds,
    String? lastMessageId,
  }) async {
    const limit = _messagesPaginationLimit;
    final chatId = IdTools.getChatId(interlocutorsIds.toList());

    DocumentSnapshot<Map<String, dynamic>>? lastMessage;

    // Если передан lastMessageId, получаем этот документ из Firestore
    if (lastMessageId != null) {
      final lastMsgSnapshot = await _firebaseFirestore
          .collection(_Keys._tMessages)
          .doc(lastMessageId)
          .get();

      if (lastMsgSnapshot.exists) {
        lastMessage = lastMsgSnapshot;
      }
    }

    Query<Map<String, dynamic>> query = _firebaseFirestore
        .collection(_Keys._tMessages)
        .where(_Keys._fMessage$chatId, isEqualTo: chatId)
        .orderBy(_Keys._fMessage$timestamp, descending: true)
        .limit(limit + 1); // +1, чтобы проверить hasNext

    // Начинаем выборку после lastMessage, если оно есть
    if (lastMessage != null) {
      query = query.startAfterDocument(lastMessage);
    }

    final response = await query.get();

    // Проверяем, есть ли еще сообщения для следующей страницы
    final hasNext = response.docs.length > limit;

    // Если есть лишний документ (для проверки hasNext), убираем его
    final docs = hasNext ? response.docs.sublist(0, limit) : response.docs;

    return Paginated<Message>(
      hasNext: hasNext,
      result: docs.map(
        (doc) => _mapper._parseChatMessage(
          messageId: doc.id,
          currentUserId: _currentUserId,
          src: doc.data(),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  @override
  Future<Message> sendMessage({
    required String toId,
    required String content,
    required MessageContentType type,
  }) async {
    final docReference = _firebaseFirestore.collection(_Keys._tMessages).doc();

    final messageData = {
      _Keys._fMessage$chatId: IdTools.getChatId([_currentUserId, toId]),
      _Keys._fMessage$fromId: _currentUserId,
      _Keys._fMessage$toId: toId,
      _Keys._fMessage$content: content,
      _Keys._fMessage$type: _mapChatMessageType(type),
      _Keys._fMessage$timestamp: DateTime.now().microsecondsSinceEpoch,
      _Keys._fMessage$isViewed: false,
    };

    try {
      await _firebaseFirestore.runTransaction((transaction) async {
        transaction.set(docReference, messageData);
      });

      return _mapper._parseChatMessage(
        messageId: docReference.id,
        currentUserId: currentUserId,
        src: messageData,
      );
    } catch (e) {
      throw Exception('Ошибка при отправке сообщения: $e');
    }
  }

  String _mapChatMessageType(MessageContentType src) {
    return switch (src) {
      MessageContentType.text => 'text',
      MessageContentType.image => 'image',
    };
  }

  // ---------------------------------------------------------------------------
  @override
  Stream<Set<Message>> getAddedModifiedMessagesStream({
    required Set<String> interlocutorsIds,
  }) {
    final chatId = IdTools.getChatId(interlocutorsIds.toList());

    return _firebaseFirestore
        .collection(_Keys._tMessages)
        .where(_Keys._fMessage$chatId, isEqualTo: chatId)
        .orderBy(_Keys._fMessage$timestamp, descending: true)
        .snapshots()
        .map((snapshot) {
      // Отбираем только новые и измененные сообщения
      final updatedMessages = snapshot.docChanges
          .where((change) =>
              change.type == DocumentChangeType.added ||
              change.type == DocumentChangeType.modified)
          .map((change) => _mapper._parseChatMessage(
                messageId: change.doc.id,
                currentUserId: _currentUserId,
                src: change.doc.data() as Map<String, dynamic>,
              ))
          .toSet();

      return updatedMessages;
    });
  }

  // ---------------------------------------------------------------------------
  @override
  Future<void> markAsViewed({required String fromId}) async {
    final chatId = IdTools.getChatId([_currentUserId, fromId]);

    final batch = _firebaseFirestore.batch();

    // Запрашиваем все сообщения, отправленные fromId, но еще не помеченные как прочитанные
    final querySnapshot = await _firebaseFirestore
        .collection(_Keys._tMessages)
        .where(_Keys._fMessage$chatId, isEqualTo: chatId)
        .where(_Keys._fMessage$fromId, isEqualTo: fromId)
        .where(_Keys._fMessage$isViewed, isEqualTo: false)
        .get();

    for (final doc in querySnapshot.docs) {
      batch.update(doc.reference, {_Keys._fMessage$isViewed: true});
    }

    // Применяем все обновления за один запрос
    await batch.commit();
  }
}
