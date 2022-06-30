import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.textSize,
      this.textWeight})
      : super(key: key);

  final String text;
  final Color textColor;
  final double textSize;
  final FontWeight? textWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: textSize,
        fontWeight: textWeight ?? FontWeight.normal,
      ),
    );
  }
}
