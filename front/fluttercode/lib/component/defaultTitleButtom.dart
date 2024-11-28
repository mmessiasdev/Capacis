import 'package:Consult/component/defaultButton.dart';
import 'package:flutter/material.dart';
import 'package:Consult/component/colors.dart';
import 'package:Consult/component/texts.dart';

class DefaultTitleButton extends StatelessWidget {
  final String title;
  final Function onClick;
  Color color;
  Color iconColor;
  DefaultTitleButton({
    Key? key,
    required this.title,
    required this.onClick,
    required this.color,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SubTextSized(text: title, size: 24, fontweight: FontWeight.bold),
          DefaultCircleButton(
            color: color,
            iconColor: iconColor,
            onClick: () {
              onClick();
            },
          ),
        ],
      ),
    );
  }
}
