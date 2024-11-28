import 'package:Consult/component/colors.dart';
import 'package:Consult/component/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DefaultTitle extends StatelessWidget {
  DefaultTitle(
      {super.key,
      this.title,
      this.subtitle,
      this.subbuttom,
      this.align,
      this.route,
      this.buttom});

  bool? buttom = false;
  String? route;

  String? title;
  String? subtitle;
  TextAlign? align;

  Widget? subbuttom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Container(
              margin: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: PrimaryText(
                      text: title,
                      color: nightColor,
                      align: align,
                    ),
                  ),
                  buttom == true
                      ? GestureDetector(
                          onTap: () {
                            route != null
                                ? Navigator.of(Get.overlayContext!)
                                    .pushReplacementNamed(route ?? "")
                                : Navigator.of(Get.overlayContext!).pop();
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .1,
                            child: const Center(
                                child: Icon(
                              Icons.arrow_back_ios,
                              size: 48,
                            )),
                          ),
                        )
                      : const SizedBox(),
                ],
              )),
        ),
        const SizedBox(
          height: 15,
        ),
        RichDefaultText(
            text: subtitle,
            align: TextAlign.start,
            size: 20,
            fontweight: FontWeight.w300,
            wid: subbuttom),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
