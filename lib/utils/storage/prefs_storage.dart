import 'package:playon/all_utils.dart';
import 'package:playon/screens/notification/component/notification_model.dart';
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
  static const _notificationId = 'NotificationId';
  static const String _scheduleNotificationList = 'notifications';

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

  Future<void> setScheduleNotificationList(
          List<MyNotificationModel> notificationList) =>
      _prefs.setString(_scheduleNotificationList, jsonEncode(notificationList));

  List<MyNotificationModel> getScheduledNotificationList() {
    final prefString = _prefs.getString(_scheduleNotificationList) ?? '';
    if (prefString.isEmpty) return [];
    final List<dynamic> decodedList = jsonDecode(prefString);
    return MyNotificationModel.fromJsonList(decodedList);
  }

  Future<void> incrementNotificationId() =>
      _prefs.setInt(_notificationId, getNotificationId() + 1);

  int getNotificationId() => _prefs.getInt(_notificationId) ?? 0;
  Future<void> removeNotification() => _prefs.remove(_scheduleNotificationList);
}
