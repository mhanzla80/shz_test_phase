import 'package:flutter/material.dart';
import 'package:playon/utils/app_theme.dart';

class AddFileFloatingActionButton extends StatelessWidget {
  final IconData icon;
  const AddFileFloatingActionButton({Key? key, this.icon = Icons.add})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppTheme.primary,
      ),
      child: Icon(icon),
    );
  }
}
