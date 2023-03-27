import 'package:playon/all_utils.dart';

class VerticalSpacing extends StatelessWidget {
  final double of;

  const VerticalSpacing({Key? key, this.of = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: of.h,
      );
}

class HorizontalSpacing extends StatelessWidget {
  final double of;

  const HorizontalSpacing({Key? key, this.of = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: of.w,
    );
  }
}

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: AppTheme.lightBlueGreyColor);
  }
}

class MyTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool obscure;
  final String? hintText;
  final bool enabled;
  final bool readOnly;
  final EdgeInsetsGeometry margin;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final int maxLines;
  final double height;

  const MyTextField({
    required this.controller,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscure = false,
    this.enabled = true,
    this.readOnly = false,
    this.margin = EdgeInsets.zero,
    this.prefixWidget,
    this.suffixWidget,
    this.maxLines = 1,
    this.height = 48.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Padding(
        padding: margin,
        child: TextFormField(
          obscureText: obscure,
          controller: controller,
          maxLines: maxLines,
          enabled: enabled,
          readOnly: readOnly,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter a Valid Text';
            }
            return null;
          },
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixIcon: prefixWidget == null
                ? null
                : Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: prefixWidget,
                  ),
            suffixIcon: suffixWidget == null
                ? null
                : Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: suffixWidget,
                  ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppTheme.primary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: AppTheme.lightBlueGreyColor,
                )),
            hintText: hintText,
            fillColor: AppTheme.primary,
            hintStyle: TextStyle(
                fontSize: 14.sp,
                color: AppTheme.lightBlueGreyColor,
                fontWeight: FontWeight.bold),
            // isDense: true,
          ),
        ),
      ),
    );
  }
}
