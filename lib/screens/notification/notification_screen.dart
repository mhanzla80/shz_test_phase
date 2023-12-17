import 'package:flutter/material.dart';
import 'package:playon/screens/notification/component/notification_bottom_sheet.dart';
import 'package:playon/screens/notification/component/notification_provider.dart';
import 'package:playon/screens/notification/component/schedule_notification_body.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = '/ScheduleNotificationScreen';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  @override
  void initState() {
    context.read<NotificationProvider>().updateList();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, size: 30),
            tooltip: 'Add Notification',
            onPressed: () =>
                NotificationBottomSheet.showNotificationBottomSheet(
                    context, _titleController, _descriptionController),
          ),
        ],
      ),
      body: Consumer<NotificationProvider>(
        builder: (context, provider, child) {
          final notificationList = provider.displayNotificationList;
          if (notificationList.isEmpty) {
            return const Center(child: Text('No Notification Schedule'));
          }

          return NotificationListBody(notificationList: notificationList);
        },
      ),
    );
  }
}
