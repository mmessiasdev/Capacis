import 'package:Consult/component/colors.dart';
import 'package:Consult/component/texts.dart';
import 'package:flutter/material.dart';

class Tips extends StatelessWidget {
  Tips({super.key, required this.desc});

  String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: nightColor, width: 2),
            borderRadius: BorderRadius.circular(5),
            color: SeventhColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            children: [
              const Icon(Icons.lightbulb),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: SubText(
                  text: desc,
                  align: TextAlign.start,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
