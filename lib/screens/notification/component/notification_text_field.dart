import 'package:flutter/material.dart';

class NotificationTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final int maxLine;
  const NotificationTextField(
      {Key? key,
      required this.controller,
      required this.labelText,
      this.maxLine = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        autofocus: true,
        maxLines: maxLine,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if ((value == null || value.isEmpty)) {
            return 'Enter a Value';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          contentPadding: const EdgeInsets.all(20),
        ),
      );
}
