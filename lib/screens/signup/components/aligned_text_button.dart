import 'package:playon/all_utils.dart';

class AlignedTextButton extends StatelessWidget {
  final String title;
  final AlignmentGeometry alignment;
  final BuildContextCallback onTap;

  const AlignedTextButton({
    required this.title,
    required this.onTap,
    this.alignment = Alignment.topRight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: alignment,
        child: TextButton(
            onPressed: () => onTap(context),
            child: title.toText(fontSize: 17, color: AppTheme.primary)));
  }
}
