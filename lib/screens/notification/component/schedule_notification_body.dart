import 'package:playon/all_utils.dart';
import 'package:playon/screens/notification/component/notification_card_text_widget.dart';
import 'package:playon/screens/notification/component/notification_model.dart';

class NotificationListBody extends StatelessWidget {
  final List<MyNotificationModel> notificationList;
  const NotificationListBody({Key? key, required this.notificationList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = notificationList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  NotificationCardTextWidget(
                    heading: 'Title :',
                    content: item.title,
                    fontSize: 20,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: NotificationCardTextWidget(
                          heading: 'Time :',
                          content: item.time.formattedTime,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: NotificationCardTextWidget(
                          heading: 'Date :',
                          content: item.time.formattedDate,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  NotificationCardTextWidget(
                    heading: 'Description :',
                    content: item.description,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: notificationList.length,
    );
  }
}
