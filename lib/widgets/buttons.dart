import 'package:playon/all_utils.dart';

class MyElevatedButton extends StatelessWidget {
  final BuildContextCallback onTap;
  final String title;
  final Color color;
  final double width;
  final double height;
  final Color titleColor;
  final EdgeInsetsGeometry margin;

  const MyElevatedButton(
    this.title, {
    required this.onTap,
    this.titleColor = AppTheme.whiteColor,
    this.width = double.infinity,
    this.height = 48,
    this.color = AppTheme.primary,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: title.toText(
              color: titleColor,
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => onTap(context),
        ),
      ),
    );
  }
}

class MyElevatedIconButton extends StatelessWidget {
  final BuildContextCallback onTap;
  final String title;
  final IconData icon;
  final Color color;
  final double width;
  final double height;
  final Color titleColor;
  final Color borderColor;
  final EdgeInsetsGeometry margin;

  const MyElevatedIconButton(
    this.title, {
    required this.onTap,
    required this.icon,
    this.titleColor = AppTheme.whiteColor,
    this.width = double.infinity,
    this.height = 48,
    this.color = AppTheme.primary,
    this.borderColor = AppTheme.primary,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          icon: Icon(icon, color: titleColor),
          label: FittedBox(
            fit: BoxFit.scaleDown,
            child: title.toText(
              color: titleColor,
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => onTap(context),
        ),
      ),
    );
  }
}
