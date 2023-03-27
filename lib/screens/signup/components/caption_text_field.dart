import 'package:playon/all_utils.dart';

class CaptionTextField extends StatelessWidget {
  final String caption;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscure;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final int maxLines;
  final double height;
  final bool enabled;
  final bool readOnly;

  const CaptionTextField({
    required this.controller,
    required this.caption,
    this.keyboardType = TextInputType.text,
    this.obscure = false,
    this.prefixWidget,
    this.suffixWidget,
    this.maxLines = 1,
    this.height = 48,
    this.enabled = true,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        caption.toText(fontSize: 15.0, color: AppTheme.lightBlueGreyColor),
        const VerticalSpacing(of: 10),
        MyTextField(
          controller: controller,
          keyboardType: keyboardType,
          obscure: obscure,
          prefixWidget: prefixWidget,
          suffixWidget: suffixWidget,
          maxLines: maxLines,
          height: height,
          enabled: enabled,
          readOnly: readOnly,
        )
      ],
    );
  }
}
