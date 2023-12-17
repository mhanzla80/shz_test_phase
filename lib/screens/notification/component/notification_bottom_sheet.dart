import 'package:playon/all_utils.dart';
import 'package:playon/screens/notification/component/notification_provider.dart';
import 'package:playon/screens/notification/component/notification_text_field.dart';
import 'package:playon/widgets/date_time_field.dart';

class NotificationBottomSheet {
  static Future<void> showNotificationBottomSheet(
      BuildContext context,
      TextEditingController titleController,
      TextEditingController descriptionController) {
    final provider = context.read<NotificationProvider>();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20,
            right: 20,
            left: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Add Alert",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                NotificationTextField(
                    controller: titleController, labelText: 'Enter a Title'),
                const SizedBox(height: 20),
                DateTimeField(onDateTimeChanged: provider.updateDateTime),
                const SizedBox(height: 20),
                NotificationTextField(
                  controller: descriptionController,
                  labelText: 'Enter a Description',
                  maxLine: 3,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () => _onPressAdd(context, provider,
                      descriptionController, titleController, formKey),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void _onPressAdd(
      BuildContext context,
      NotificationProvider provider,
      TextEditingController descriptionController,
      TextEditingController titleController,
      GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      if (provider.selectedDateAndTime == null) {
        await NotificationProvider.showErrorDialog(
            context, 'please select date and time');
        return;
      }
      final id = PrefsStorage.instance.getNotificationId();
      final isSuccess = await provider.setNotification(
          provider.selectedDateAndTime.toString(),
          titleController.text.trim(),
          descriptionController.text.trim(),
          id,
          context);
      if (isSuccess && context.mounted) {
        Navigator.pop(context);
        descriptionController.clear();
        titleController.clear();
        provider.updateList();
        provider.selectedDateAndTime = null;
      }
    }
  }
}
