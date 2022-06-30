import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget(
      {Key? key,
      required this.onIconTap,
      required this.icon,
      required this.iconSize,
      this.iconColor})
      : super(key: key);

  final VoidCallback onIconTap;
  final IconData icon;
  final double iconSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onIconTap,
        icon: Icon(
          icon,
          color: iconColor ?? Colors.black,
          size: iconSize,
        ));
  }
}
