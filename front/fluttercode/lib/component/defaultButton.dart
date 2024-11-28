import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultCircleButton extends StatelessWidget {
  DefaultCircleButton(
      {super.key,
      required this.color,
      required this.iconColor,
      this.icon,
      required this.onClick});
  Color color;
  Color iconColor;
  IconData? icon;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        onClick();
      },
      child: CircleAvatar(
        maxRadius: 40,
        backgroundColor: color,
        child: Icon(
          icon ?? Icons.arrow_right_alt,
          color: iconColor,
        ),
      ),
    );
  }
}
