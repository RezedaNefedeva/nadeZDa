
import 'package:flutter/material.dart';
import 'package:nadezda/export.dart';

class CustomTextFieldMulty extends StatefulWidget {
  const CustomTextFieldMulty({super.key, required this.controller, required this.text_style,});
  final TextEditingController controller;
  final TextStyle? text_style;

  @override
  State<CustomTextFieldMulty> createState() => _CustomTextFieldMultyState();
}

class _CustomTextFieldMultyState extends State<CustomTextFieldMulty> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: widget.text_style,
      minLines: 1,
      maxLines: 3,
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

