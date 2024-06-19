import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quectochat/domain/interfaces/i_api_facade.dart';
import 'package:quectochat/domain/models/current_user.dart';

import '../domain/models/api_exceptions.dart';
import 'mapper/mapper.dart';

final class ApiFacade implements IApiFacade {
  ApiFacade() {
    _authService = FirebaseAuth.instance;
    _store = FirebaseFirestore.instance;
    _mapper = ApiDataMapper();
  }

  late final FirebaseAuth _authService;
  late final FirebaseFirestore _store;
  late final ApiDataMapper _mapper;

  /// Логин пользователя
  @override
  Future<CurrentUser?> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final credentials = await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userData = credentials.user;

      return userData == null ? null : _mapper.mapCurrentUser(userData);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw AuthUserNotFound();
        case 'wrong-password':
          throw AuthUserWrongPassword();
        default:
          rethrow;
      }
    } on Object {
      rethrow;
    }
  }

  /// Регистрация пользователя
  @override
  Future<CurrentUser?> registration({
    required String email,
    required String password,
  }) async {
    try {
      final credentials = await _authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // fixme - допилить:
      final userData = credentials.user;
      if (userData != null) {
        final result = await _store
            .collection('key')
            .where('id', isEqualTo: userData.uid)
            .get();
      }

      return userData == null ? null : _mapper.mapCurrentUser(userData);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw AuthUserNotFound();
        case 'wrong-password':
          throw AuthUserWrongPassword();
        default:
          rethrow;
      }
    } on Object {
      rethrow;
    }
  }
}
