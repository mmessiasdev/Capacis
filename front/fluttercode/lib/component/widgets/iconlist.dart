import 'package:Consult/component/texts.dart';
import 'package:flutter/material.dart';

class IconList extends StatelessWidget {
  const IconList(
      {super.key,
      required this.onClick,
      required this.icon,
      required this.title});

  final Function onClick;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: GestureDetector(
            onTap: () => onClick(),
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 38,
                ),
                SubText(
                  text: title,
                  align: TextAlign.center,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
