import '../../data/api_facade.dart';
import '../interfaces/i_api_facade.dart';
import 'builders.dep_gen.dart';

class Environment extends DepGenEnvironment {
  Future<Environment> prepare() async {
    /// Сетевой клиент
    final api = ApiFacade();
    registry<IApiFacade>(api);

    return this;
  }
}
