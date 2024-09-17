import 'package:quectochat/domain/interfaces/i_auth_repository.dart';

import '../../data/firebase/firebase_service.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/chat_repository.dart';
import '../interfaces/i_api_facade.dart';
import '../interfaces/i_chat_repository.dart';
import 'builders.dep_gen.dart';

class Environment extends DepGenEnvironment {
  Future<Environment> prepare() async {
    /// Сетевой клиент
    final api = FirebaseService();
    registry<INetworkFacade>(api);

    /// Репозиторий аутентификации
    registry<IAuthRepository>(AuthRepository(networkFacade: api));

    /// Репозиторий чата
    registry<IChatRepository>(ChatRepository(networkFacade: api));

    return this;
  }
}
