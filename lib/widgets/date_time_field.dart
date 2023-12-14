import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:playon/utils/my_extensions.dart';

class DateTimeField extends StatefulWidget {
  final ValueChanged<DateTime> onDateTimeChanged;

  const DateTimeField({required this.onDateTimeChanged, Key? key})
      : super(key: key);

  @override
  _DateTimeFieldState createState() => _DateTimeFieldState();
}

class _DateTimeFieldState extends State<DateTimeField> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
                onPressed: () => onPressPickDate(context),
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                icon: const Icon(Icons.calendar_today),
                label: Text(DateFormat.yMMMd().format(selectedDate))),
            TextButton.icon(
                onPressed: () => onPressPickTime(context),
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                icon: const Icon(Icons.timer),
                label: Text(DateFormat.jm().format(selectedDate))),
          ],
        ),
        const Divider(),
      ],
    );
  }

  void onPressPickDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now().subtract(const Duration(days: 1000)),
        lastDate: DateTime.now().add(const Duration(days: 1000)));
    if (picked != null && picked != selectedDate.dateOnly) {
      setState(() {
        selectedDate = selectedDate.applyDate(picked);
        widget.onDateTimeChanged(selectedDate);
      });
    }
  }

  void onPressPickTime(BuildContext context) async {
    final picked = await showTimePicker(
        context: context, initialTime: selectedDate.timeOfDay);
    if (picked != null && picked != selectedDate.timeOfDay) {
      setState(() {
        selectedDate = selectedDate.applyTime(picked);
        widget.onDateTimeChanged(selectedDate);
      });
    }
  }
}
