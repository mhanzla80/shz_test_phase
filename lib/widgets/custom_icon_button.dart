import 'package:playon/all_utils.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final BuildContextCallback onTap;
  final Color color;

  const CustomIconButton({
    required this.icon,
    required this.onTap,
    this.color = AppTheme.lightBlueGreyColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: color),
      onPressed: () => onTap(context),
    );
  }
}
