import 'package:quectochat/domain/interfaces/i_auth_repository.dart';

import '../../data/firebase/firebase_service.dart';
import '../../data/repositories/auth_repository.dart';
import '../interfaces/i_api_facade.dart';
import 'builders.dep_gen.dart';

class Environment extends DepGenEnvironment {
  Future<Environment> prepare() async {
    /// Сетевой клиент
    final api = FirebaseService();
    registry<INetworkFacade>(api);

    /// Репозиторий аутентификации
    final authRepository = AuthRepository(networkFacade: api);
    registry<IAuthRepository>(authRepository);

    return this;
  }
}
