import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quectochat/domain/interfaces/i_api_facade.dart';
import 'package:quectochat/domain/models/user_details.dart';

import '../../domain/models/chat_message.dart';
import '../../domain/models/chat_message_type.dart';
import '../../domain/models/network_exceptions.dart';

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
  String? _currentUserId;

  /// Пагинация сообщений: количество сообщений на страницу
  static const _messagesPaginationLimit = 20;

  /// Пагинация сообщений: текущий снэпшот сообщений, для получения следующей страницы
  QueryDocumentSnapshot<Map<String, dynamic>>? _lastVisible;

  // АВТРИЗАЦИЯ:
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  /// Проверка залогиненности пользователя
  @override
  bool checkAuth() => _firebaseAuth.currentUser != null;

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

      _currentUserId = credentials.user?.uid;
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

      _currentUserId = credentials.user?.uid;

      // Проверяем, если пользователь успешно создан:
      if (_currentUserId != null) {
        final result = await _firebaseFirestore
            .collection(_Keys._tUsers)
            .where(_Keys._fUser$id, isEqualTo: _currentUserId)
            .get();

        // Если нет данных по данному пользователю в Firestore, то делаем запись:
        if (result.docs.isEmpty) {
          await _firebaseFirestore
              .collection(_Keys._tUsers)
              .doc(_currentUserId)
              .set(_mapper._mapUserDetails(UserDetails(
                id: _currentUserId!,
                fullName: '$firstName $lastName',
                createdAt: DateTime.now(),
              )));
        }
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
    _currentUserId = null;
  }

  // СОБЕСЕДНИКИ:
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  /// Получение пользователей для переписки
  @override
  Future<Iterable<UserDetails>> getUsers({
    String textSearch = '',
  }) async {
    final response = textSearch.isEmpty
        ? await _firebaseFirestore.collection(_Keys._tUsers).get()
        : await _firebaseFirestore
            .collection(_Keys._tUsers)
            .where(_Keys._fUser$fullName, arrayContains: textSearch)
            .get();

    return response.docs
        .map((doc) => _mapper._parseUserDetails(doc.data()))
        .where((user) => user.id != _currentUserId);
  }

  // СООБЩЕНИЯ:
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  /// Получение сообщений в пагинированном виде
  /// (для получения последующих страниц isNext должен быть true)
  @override
  Future<Iterable<ChatMessage>> getChatMessages({
    required String toId,
    bool isNext = false,
  }) async {
    final groupChatId = '$_currentUserId-$toId';
    final response = !isNext
        ? await _firebaseFirestore
            .collection(_Keys._tMessages)
            .doc(groupChatId)
            .collection(groupChatId)
            .orderBy(_Keys._fMessage$timestamp, descending: true)
            .limit(_messagesPaginationLimit)
            .get()
        : await _firebaseFirestore
            .collection(_Keys._tMessages)
            .doc(groupChatId)
            .collection(groupChatId)
            .orderBy(_Keys._fMessage$timestamp, descending: true)
            .startAfterDocument(_lastVisible!)
            .limit(_messagesPaginationLimit)
            .get();

    _lastVisible = response.docs.last;

    return response.docs.map((doc) => _mapper._parseChatMessage(doc.data()));
  }

  /// Отправка сообщения
  @override
  Future<void> sendMessage({
    required String toId,
    required String content,
    required ChatMessageType type,
  }) async {
    final createdAt = DateTime.now();
    final groupChatId = '$_currentUserId-$toId';
    final docReference = _firebaseFirestore
        .collection(_Keys._tMessages)
        .doc(groupChatId)
        .collection(groupChatId)
        .doc(createdAt.microsecondsSinceEpoch.toString());

    await _firebaseFirestore.runTransaction((transaction) async {
      transaction.set(
        docReference,
        _mapper._mapChatMessage(ChatMessage(
          createdAt: createdAt,
          fromId: _currentUserId ?? '',
          toId: toId,
          content: content,
          type: type,
        )),
      );
    });
  }

  /// Получить стрим сообщений
  @override
  Stream<ChatMessage> getNewMessagesStream({required String toId}) {
    final groupChatId = '$_currentUserId-$toId';

    return _firebaseFirestore
        .collection(_Keys._tMessages)
        .doc(groupChatId)
        .collection(groupChatId)
        .orderBy(_Keys._fMessage$timestamp, descending: true)
        .limit(1)
        .snapshots()
        .map((m) => _mapper._parseChatMessage(m.docs.first.data()));
  }
}
