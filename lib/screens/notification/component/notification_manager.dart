import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:playon/screens/notification/component/notification_model.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationManager {
  static final NotificationManager _instance = NotificationManager._internal();
  static NotificationManager get instance => _instance;

  factory NotificationManager() => _instance;
  NotificationManager._internal();

  static const androidDetails = AndroidNotificationDetails(
      'com.example.shz_test_phase', 'Vaccination',
      channelDescription: 'Our notifications will be displayed here',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false);

  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  bool _isAndroidNotificationsEnabled = false;

  Future<void> init() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const androidSettings = AndroidInitializationSettings('app_icon');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    final settings = InitializationSettings(
      android: androidSettings,
      iOS: initializationSettingsDarwin,
    );
    await _flutterLocalNotificationsPlugin.initialize(settings);
    tz.initializeTimeZones();
    _isAndroidNotificationsEnabled = await _isAndroidPermissionGranted();
    _requestPermissions();
  }

  Future<bool> _isAndroidPermissionGranted() async {
    if (Platform.isAndroid) {
      final bool granted = await _flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;

      return granted;
    }
    return false;
  }

  Future<void> _requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid && !_isAndroidNotificationsEnabled) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          _flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>();

      final bool? granted =
          await androidImplementation?.requestNotificationsPermission();
      _isAndroidNotificationsEnabled = granted ?? false;
    }

    if (Platform.isAndroid && !_isAndroidNotificationsEnabled) return;
  }

  Future<bool> scheduleNotification(MyNotificationModel model) async {
    return await checkNotificationSchedule(model);
  }

  Future<bool> checkNotificationSchedule(MyNotificationModel model) async {
    final date = DateTime.parse(model.time);
    final currentDate = DateTime.now();

    if (date.isAtSameMomentAs(currentDate) || date.isBefore(currentDate)) {
      return false;
    }
    final diff = date.difference(currentDate);
    final duration = Duration(
        seconds: diff.inSeconds % 60,
        minutes: diff.inMinutes % 60,
        hours: diff.inHours % 24,
        days: diff.inDays % 24);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
        model.id,
        model.title,
        model.description,
        tz.TZDateTime.now(tz.local).add(duration),
        const NotificationDetails(android: androidDetails),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
    return true;
  }
}

class NotificationModel {
  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    this.payload,
  });

  final int id;
  final String title;
  final String body;
  final String? payload;
}
