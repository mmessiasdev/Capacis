import 'package:flutter/material.dart';
import 'package:Consult/component/colors.dart';
import 'package:Consult/component/texts.dart';

class ThumbPost extends StatelessWidget {
  String title;
  String desc;
  String data;

  ThumbPost({
    super.key,
    required this.title,
    required this.desc,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: SixthColor,
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SecundaryText(
                text: title,
                align: TextAlign.start,
                color: nightColor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SubText(
                  text: desc,
                  align: TextAlign.start,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SubTextSized(
                    text: data,
                    align: TextAlign.end,
                    size: 15,
                    fontweight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
