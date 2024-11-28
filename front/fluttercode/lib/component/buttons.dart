import 'package:Consult/component/colors.dart';
import 'package:Consult/component/padding.dart';
import 'package:Consult/component/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton(
      {super.key,
      required this.text,
      this.color,
      this.padding,
      this.icon,
      this.colorText});
  String text;
  Color? color;
  Color? colorText;
  EdgeInsetsGeometry? padding;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: color ?? TerciaryColor,
      ),
      child: Padding(
          padding: padding ?? defaultPaddingHorizon,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonText(
                  text: text,
                  colorText: colorText ?? nightColor,
                ),
                icon != null
                    ? Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            icon,
                            color: colorText ?? nightColor,
                            size: 28,
                          ),
                        ],
                      )
                    : const SizedBox(),
              ])),
    );
  }
}
