import 'package:flutter/material.dart';

import '../../../component/colors.dart';
import '../../../component/texts.dart';

class ButtomSelect extends StatelessWidget {
  ButtomSelect(
      {Key? key,
      required this.content,
      required this.name,
      required this.colorBack,
      required this.colorText,
      required this.time,
      required this.data})
      : super(key: key);
  String content;
  String name;
  Color colorBack;
  Color colorText;
  String data;
  String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorBack,
        borderRadius: BorderRadius.circular(6),
      ),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: TerciaryColor,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: SubTextSized(
                            fontweight: FontWeight.bold,
                            size: 15,
                            text: name,
                            align: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 10, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SubTextSized(
                                  size: 12,
                                  align: TextAlign.start,
                                  text: time,
                                  fontweight: FontWeight.w700,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                SubText(
                                  text: data,
                                  align: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(),
          ],
        ),
      ),
    );
  }
}
