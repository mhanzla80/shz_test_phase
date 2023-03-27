import 'package:playon/all_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsStorage implements IStorage {
  PrefsStorage._prefsStorage();
  static final PrefsStorage _instance = PrefsStorage._prefsStorage();

  static PrefsStorage get instance => _instance;

  factory PrefsStorage() {
    return _instance;
  }

  static late SharedPreferences _prefs;

  static const String _keyUser = 'user';
  static const String _keyNotifications = 'notifications';
  static const String _keyLastLocation = 'lastLocation';

  @override
  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  @override
  Future<bool> setUser(LocalUser user) =>
      _prefs.setString(_keyUser, jsonEncode(user.toJson()));

  @override
  LocalUser? get user {
    final userString = _prefs.getString(_keyUser);
    if (userString != null) {
      final userJson = jsonDecode(userString);
      return LocalUser.fromJson(userJson);
    }
    return null;
  }

  @override
  Future<bool> removeUser() => _prefs.remove(_keyUser);

}
