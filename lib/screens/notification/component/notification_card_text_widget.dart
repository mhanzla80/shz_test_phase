import 'package:flutter/material.dart';

class NotificationCardTextWidget extends StatelessWidget {
  final double fontSize;
  final String heading;
  final String content;
  const NotificationCardTextWidget(
      {Key? key,
      required this.heading,
      required this.content,
      this.fontSize = 11})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: 11,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        );
    return RichText(
      text: TextSpan(
        text: heading,
        style: style.copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: '\t$content',
              style: style.copyWith(color: Colors.black, fontSize: fontSize)),
        ],
      ),
    );
  }
}
