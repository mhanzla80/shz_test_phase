import 'package:get_it/get_it.dart';
import 'package:playon/all_utils.dart';

final _locator = GetIt.instance;

IStorage get storage => _locator<IStorage>();
IUserRepository get userRepository => _locator<IUserRepository>();

abstract class DependencyInjectionEnvironment {
  static Future<void> setup() async {
    _locator.registerLazySingleton<IStorage>(() => PrefsStorage());
    await storage.init();

    _locator.registerLazySingleton<IUserRepository>(() => UserApi());
  }
}
