import 'package:flutter/material.dart';
import 'package:playon/screens/notification/component/notification_manager.dart';
import 'package:playon/screens/notification/component/notification_model.dart';
import 'package:playon/utils/storage/prefs_storage.dart';

class NotificationProvider with ChangeNotifier {
  DateTime? selectedDateAndTime;
  List<MyNotificationModel> displayNotificationList;
  final List<MyNotificationModel> _scheduleNotificationList;

  NotificationProvider()
      : _scheduleNotificationList =
            PrefsStorage.instance.getScheduledNotificationList(),
        displayNotificationList =
            PrefsStorage.instance.getScheduledNotificationList();

  Future<bool> setNotification(String dateTime, String title,
      String description, int id, BuildContext context) async {
    final notificationModel = MyNotificationModel(
        id: id, description: description, title: title, time: dateTime);
    final isSuccess = await NotificationManager.instance
        .scheduleNotification(notificationModel);

    if (!isSuccess && context.mounted) {
      showErrorDialog(context,
          'please select your date and time that is greater than current date and time');
      return false;
    }

    _scheduleNotificationList.add(notificationModel);
    _scheduleNotificationList.sort((a, b) => a.time.compareTo(b.time));
    await PrefsStorage.instance
        .setScheduleNotificationList(_scheduleNotificationList);
    await PrefsStorage.instance.incrementNotificationId();
    displayNotificationList = _scheduleNotificationList;
    return true;
  }

  void updateList() async {
    if (displayNotificationList.isEmpty) return;
    displayNotificationList = displayNotificationList
        .where(
            (element) => DateTime.parse(element.time).isAfter(DateTime.now()))
        .toList();
    if (displayNotificationList.isEmpty) {
      await PrefsStorage.instance.removeNotification();
      return;
    } else {
      await PrefsStorage.instance
          .setScheduleNotificationList(displayNotificationList);
      notifyListeners();
    }
  }

  void updateDateTime(DateTime datetime) {
    selectedDateAndTime = datetime;
    notifyListeners();
  }

  static Future<void> showErrorDialog(BuildContext context, String content) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("ErrorDialog"),
        content: Text(content),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text('OK'))
        ],
      ),
    );
  }
}
