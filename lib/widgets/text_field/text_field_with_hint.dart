
import 'package:flutter/material.dart';
import 'package:nadezda/export.dart';

class CustomTextFieldWithHint extends StatefulWidget {
  const CustomTextFieldWithHint({super.key,
    required this.controller,
    required this.text_style,
    required this.text_hint,
  });
  final TextEditingController controller;
  final TextStyle? text_style;
  final String text_hint;

  @override
  State<CustomTextFieldWithHint> createState() => _CustomTextFieldWithHintState();
}

class _CustomTextFieldWithHintState extends State<CustomTextFieldWithHint> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: widget.text_style,
      decoration: InputDecoration(
        hintText: widget.text_hint,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              width: 1, color: red()),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              width: 3, color: red()),
        ),
      ),
    );
  }
}
