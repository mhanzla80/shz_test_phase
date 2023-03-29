import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LabeledTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String? hint;
  final int maxLine;
  final int? maxLetters;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final bool obscure;
  final bool isCountShow;

  const LabeledTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.hint,
    this.obscure = false,
    this.maxLine = 1,
    this.maxLetters = 20,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.isCountShow = false,
  }) : super(key: key);

  @override
  State<LabeledTextField> createState() => _LabeledTextFieldState();
}

class _LabeledTextFieldState extends State<LabeledTextField> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          label: Text(widget.label, style: textTheme.titleSmall),
          hintText: widget.hint,
          counterText: widget.isCountShow
              ? '${widget.controller.text.length}/${widget.maxLetters}'
              : null,
        ),
        inputFormatters: widget.isCountShow
            ? [
                LengthLimitingTextInputFormatter(widget.maxLetters),
              ]
            : null,
        maxLines: widget.maxLine,
        obscureText: widget.obscure,
        validator: _validate,
        onChanged: (value) => setState(() => widget.onChanged?.call(value)));
  }

  String? _validate(value) {
    if (value!.isEmpty) return 'Required *';
    return null;
  }
}
