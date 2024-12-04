import 'package:Consult/component/colors.dart';
import 'package:Consult/component/texts.dart';
import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  InfoText({super.key, this.title, this.stitle, required this.icon});

  String? title;
  String? stitle;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          CircleAvatar(
            child: Icon(
              icon,
              color: lightColor,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          RichDefaultText(
            text: '$title \n',
            size: 20,
            wid: SecundaryText(
                text: '$stitle', color: nightColor, align: TextAlign.start),
          ),
        ],
      ),
    );
  }
}
