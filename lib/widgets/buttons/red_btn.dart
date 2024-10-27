
import 'package:flutter/material.dart';
import 'package:nadezda/export.dart';

class RedBtn extends StatefulWidget {
  const RedBtn({super.key, required this.text, required this.width, required this.height});
  final double width;
  final double height;
  final String text;

  @override
  State<RedBtn> createState() => _RedBtnState();
}

class _RedBtnState extends State<RedBtn> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: red(),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.text, style: theme.textTheme.bodyLarge,),
        ],
      )
    );
  }
}
