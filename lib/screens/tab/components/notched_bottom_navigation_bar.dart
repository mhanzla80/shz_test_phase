import 'package:playon/all_utils.dart';
import 'package:playon/widgets/custom_icon_button.dart';

class NotchedBottomNavigationBar extends StatelessWidget {
  final ValueChanged<int> onItemTapped;
  final int selectedIndex;

  const NotchedBottomNavigationBar({
    required this.onItemTapped,
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 15,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CustomIconButton(
            icon: Icons.explore_outlined,
            onTap: (_) => onItemTapped(0),
            color: selectedIndex == 0
                ? AppTheme.primary
                : AppTheme.lightBlueGreyColor,
          ),
          CustomIconButton(
            icon: Icons.chat,
            onTap: (_) => onItemTapped(1),
            color: selectedIndex == 1
                ? AppTheme.primary
                : AppTheme.lightBlueGreyColor,
          ),
          const HorizontalSpacing(of: 40),
          CustomIconButton(
            icon: Icons.notifications,
            onTap: (_) => onItemTapped(2),
            color: selectedIndex == 2
                ? AppTheme.primary
                : AppTheme.lightBlueGreyColor,
          ),
          CustomIconButton(
            icon: Icons.person_rounded,
            onTap: (_) => onItemTapped(3),
            color: selectedIndex == 3
                ? AppTheme.primary
                : AppTheme.lightBlueGreyColor,
          )
        ],
      ),
    );
  }
}
