import 'package:Consult/component/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.dualRing
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 5
    ..progressColor = Colors.white
    ..backgroundColor = SecudaryColor
    ..indicatorColor = PrimaryColor
    ..textColor = Colors.white
    ..textStyle = TextStyle(fontFamily: 'Montserrat')
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.clear
    ..dismissOnTap = true;
}
