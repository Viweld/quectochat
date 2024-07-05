import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quectochat/domain/interfaces/i_api_facade.dart';
import 'package:quectochat/domain/models/user_details.dart';

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
  bool checkAuth() => _firebaseAuth.currentUser != null;

  // ---------------------------------------------------------------------------
  /// Логин пользователя
  @override
  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
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
              .set(_mapper._mapCurrentUser(UserDetails(
                id: userData.uid,
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
  Future<void> logOut() => _firebaseAuth.signOut();

// // ---------------------------------------------------------------------------
// /// Получение пользователя для переписки
// Future<Iterable<ChatListItem>> getChatList(
//   String pathCollection,
//   int limit,
//   String textSearch,
// ) async {
//   Iterable<Map<String, dynamic>> data;
//
//   if (textSearch.isEmpty) {
//     final response = await _firebaseFirestore
//         .collection(pathCollection)
//         .limit(limit)
//         .where(_Constants._fUser$nickName)
//         .get();
//
//     data = response.docs.map((e) => e.data());
//   } else {
//     final response = await _firebaseFirestore
//         .collection(pathCollection)
//         .limit(limit)
//         .where(_Constants._fUser$nickName)
//         .get();
//
//     data = response.docs.map((e) => e.data());
//   }
//
//   return
// }
}
