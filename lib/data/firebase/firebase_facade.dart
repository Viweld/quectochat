import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quectochat/domain/interfaces/i_api_facade.dart';
import 'package:quectochat/domain/models/current_user.dart';

import '../../domain/models/network_exceptions.dart';

part 'constants.dart';

part 'mapper.dart';

final class FirebaseFacade implements INetworkFacade {
  FirebaseFacade() {
    _firebaseAuth = FirebaseAuth.instance;
    _firebaseFirestore = FirebaseFirestore.instance;
    _mapper = _Mapper();
  }

  late final FirebaseAuth _firebaseAuth;
  late final FirebaseFirestore _firebaseFirestore;
  late final _Mapper _mapper;

  // ---------------------------------------------------------------------------
  /// Проверка залогиненности пользователя
  @override
  CurrentUser? checkAuth() {
    final userData = _firebaseAuth.currentUser;
    return userData == null ? null : _mapper._parseCurrentUser(userData);
  }

  // ---------------------------------------------------------------------------
  /// Логин пользователя
  @override
  Future<CurrentUser?> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final credentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userData = credentials.user;

      return userData == null ? null : _mapper._parseCurrentUser(userData);
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
  Future<CurrentUser?> registration({
    required String email,
    required String password,
  }) async {
    try {
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Проверяем, если пользователь успешно создан:
      final userData = credentials.user;
      if (userData != null) {
        final result = await _firebaseFirestore
            .collection(_Constants._tUser)
            .where(_Constants._fUser$id, isEqualTo: userData.uid)
            .get();

        // Если нет данных по данному пользователю в Firestore, то делаем запись:
        if (result.docs.isEmpty) {
          await _firebaseFirestore
              .collection(_Constants._tUser)
              .doc(userData.uid)
              .set(_mapper._mapCurrentUser(userData));
        }
      }

      return userData == null ? null : _mapper._parseCurrentUser(userData);
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
  Future<void> logOut() => _firebaseAuth.signOut();
}
