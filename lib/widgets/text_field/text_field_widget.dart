import 'package:flutter/material.dart';
import 'package:pix/widgets/button/icon_button_widget.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.hint,
    required this.iconSize,
    required this.onIconTap,
    required this.icon,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final double iconSize;
  final VoidCallback onIconTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
            controller: controller,
            decoration:
                InputDecoration(hintText: hint, border: InputBorder.none),
          )),
          IconButtonWidget(onIconTap: onIconTap, icon: icon, iconSize: iconSize)
        ],
      ),
    );
  }
}
