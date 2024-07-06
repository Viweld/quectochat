import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quectochat/domain/interfaces/i_api_facade.dart';
import 'package:quectochat/domain/models/user_details.dart';

import '../../domain/models/network_exceptions.dart';

part 'keys.dart';

part 'mapper.dart';

final class FirebaseFacade implements INetworkFacade {
  FirebaseFacade() {
    _firebaseAuth = FirebaseAuth.instance;
    _firebaseFirestore = FirebaseFirestore.instance;
    _mapper = _Mapper();
  }

  String? _currentUserId;

  late final FirebaseAuth _firebaseAuth;
  late final FirebaseFirestore _firebaseFirestore;
  late final _Mapper _mapper;

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
            .collection(_Keys._tUser)
            .where(_Keys._fUser$id, isEqualTo: _currentUserId)
            .get();

        // Если нет данных по данному пользователю в Firestore, то делаем запись:
        if (result.docs.isEmpty) {
          await _firebaseFirestore
              .collection(_Keys._tUser)
              .doc(_currentUserId)
              .set(_mapper._mapCurrentUser(UserDetails(
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

  // Другие пользователи:
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  /// Получение пользователей для переписки
  @override
  Future<Iterable<UserDetails>> getUsers({
    required int limit,
    required String textSearch,
  }) async {
    final response = textSearch.isEmpty
        ? await _firebaseFirestore.collection(_Keys._tUser).limit(limit).get()
        : await _firebaseFirestore
            .collection(_Keys._tUser)
            .limit(limit)
            .where(_Keys._fUser$fullName, arrayContains: textSearch)
            .get();

    return response.docs
        .map((doc) => _mapper._parseCurrentUser(doc.data()))
        .where((user) => user.id != _currentUserId);
  }
}
