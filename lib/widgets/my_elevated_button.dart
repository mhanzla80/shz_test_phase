import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const MyElevatedButton({super.key, required this.onTap, this.title = 'Next'});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(title),
    );
  }
}
