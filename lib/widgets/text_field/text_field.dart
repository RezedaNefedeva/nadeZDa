
import 'package:flutter/material.dart';
import 'package:nadezda/export.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key, required this.controller, required this.text_style,});
  final TextEditingController controller;
  final TextStyle? text_style;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      controller: widget.controller,
      style: widget.text_style,
      decoration: InputDecoration(
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


