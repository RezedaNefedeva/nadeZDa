
import 'package:flutter/material.dart';
import 'package:nadezda/export.dart';

class GreyBtn extends StatefulWidget {
  const GreyBtn({super.key,
    required this.width,
    required this.height,
    required this.first_text,
    required this.first_text_style,
    required this.second_text,
    required this.second_text_style,
    required this.third_text,
    required this.third_text_style,
    required this.fouth_text,
    required this.fouth_text_style,
  });
  final double width;
  final double height;
  final String first_text;
  final TextStyle? first_text_style;
  final String second_text;
  final TextStyle? second_text_style;
  final String third_text;
  final TextStyle? third_text_style;
  final String fouth_text;
  final TextStyle? fouth_text_style;

  @override
  State<GreyBtn> createState() => _GreyBtnState();
}

class _GreyBtnState extends State<GreyBtn> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: grey(),
          borderRadius: BorderRadius.circular(30)
      ),
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.first_text, style: widget.first_text_style,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.second_text, style: widget.second_text_style,),
                const SizedBox(width: 8,),
                Text(widget.third_text, style: widget.third_text_style,),
              ],
            ),
            const SizedBox(height: 13,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.fouth_text, style: widget.fouth_text_style,),
              ],
            ),
          ],
        ),
      )
    );
  }
}
