import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix/widgets/text/text_widget.dart';

class ColumnTileWidget extends StatelessWidget {
  const ColumnTileWidget(
      {Key? key,
      required this.color,
      required this.text,
      required this.textSize,
      required this.iconSize,
      required this.icon,
      this.textWeight})
      : super(key: key);

  final String text;
  final IconData icon;
  final double iconSize;
  final Color color;
  final double textSize;
  final FontWeight? textWeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: iconSize,
          color: color,
        ),
        TextWidget(
            text: text,
            textColor: color,
            textSize: textSize,
            textWeight: textWeight),
      ],
    );
  }
}
