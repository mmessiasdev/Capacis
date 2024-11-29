import 'package:Consult/component/texts.dart';
import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  InfoText({super.key, this.title, this.stitle});

  String? title;
  String? stitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubTextSized(
              text: title ?? "", size: 16, fontweight: FontWeight.w300),
          SubTextSized(
              text: stitle ?? "", size: 20, fontweight: FontWeight.w600),
        ],
      ),
    );
  }
}
