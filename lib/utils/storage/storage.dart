import 'package:playon/all_utils.dart';

abstract class IStorage {
  Future<void> init();

  Future<bool> setUser(LocalUser user);
  LocalUser? get user;
  Future<bool> removeUser();
}
