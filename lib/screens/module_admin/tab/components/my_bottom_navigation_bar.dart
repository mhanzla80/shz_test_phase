import 'package:flutter/material.dart';
import 'package:playon/utils/app_theme.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int isSelectedIndex;
  final ValueChanged<int> onItemTapped;
  const MyBottomNavigationBar(
      {Key? key, required this.isSelectedIndex, required this.onItemTapped})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 15,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => onItemTapped(0),
            icon: const Icon(Icons.home),
            color: isSelectedIndex == 0 ? AppTheme.primary : Colors.grey,
          ),
          IconButton(
            onPressed: () => onItemTapped(1),
            icon: const Icon(Icons.feed_outlined),
            color: isSelectedIndex == 1 ? AppTheme.primary : Colors.grey,
          ),
        ],
      ),
    );
  }
}
