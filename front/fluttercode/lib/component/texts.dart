import 'dart:ui';

import 'package:Consult/component/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryText extends StatelessWidget {
  PrimaryText(
      {this.text, required this.color, this.align, this.maxl, this.over});
  String? text;
  Color color;
  TextAlign? align;
  TextOverflow? over;
  int? maxl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text ?? "",
        maxLines: maxl,
        overflow: over,
        textAlign: align ?? TextAlign.start,
        style: GoogleFonts.montserrat(
          fontSize: 30,
          textStyle: TextStyle(
              height: 1,
              color: color,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class SecundaryText extends StatelessWidget {
  SecundaryText(
      {required this.text,
      required this.color,
      required this.align,
      this.maxl,
      this.over});
  String text;
  Color color;
  TextAlign align;
  TextOverflow? over;
  int? maxl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        maxLines: maxl,
        overflow: over,
        textAlign: align,
        style: GoogleFonts.montserrat(
          fontSize: 20,
          textStyle: TextStyle(
            height: 1,
            fontWeight: FontWeight.w500,
            color: color,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  ButtonText({required this.text, this.colorText});
  String text;
  Color? colorText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          fontSize: 24,
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: colorText ?? nightColor,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

class ButtomSecundary extends StatelessWidget {
  ButtomSecundary({
    required this.text,
  });
  String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          fontSize: 20,
          textStyle: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

class SubText extends StatelessWidget {
  SubText(
      {required this.text,
      required this.align,
      this.color,
      this.maxl,
      this.over});
  String text;
  TextAlign align;
  Color? color;
  TextOverflow? over;
  int? maxl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        overflow: over,
        maxLines: maxl,
        textAlign: align,
        style: GoogleFonts.montserrat(
          fontSize: 12,
          color: color ?? nightColor,
          fontWeight: FontWeight.w600,
          textStyle: TextStyle(
            color: nightColor,
            height: 1,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

class SubTextSized extends StatelessWidget {
  SubTextSized(
      {required this.text,
      this.color,
      this.align,
      required this.size,
      required this.fontweight,
      this.tdeco});
  String text;
  Color? color;
  TextAlign? align;
  double size;
  FontWeight fontweight;
  TextDecoration? tdeco;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        textAlign: align == null ? TextAlign.start : align,
        style: GoogleFonts.montserrat(
          fontSize: size,
          textStyle: TextStyle(
            height: 1,
            color: color == null ? nightColor : color,
            fontWeight: fontweight,
            decoration: tdeco == null ? TextDecoration.none : tdeco,
          ),
        ),
      ),
    );
  }
}

class RichDefaultText extends StatelessWidget {
  RichDefaultText(
      {this.wid, this.text, this.align, this.size, this.fontweight});

  Widget? wid;
  String? text;
  TextAlign? align;
  double? size;
  FontWeight? fontweight;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text == null ? "" : text, // Texto antes do botão
        style: GoogleFonts.montserrat(
          fontSize: size,
          textStyle: TextStyle(
            color: nightColor,
            fontWeight: fontweight,
            decoration: TextDecoration.none,
          ),
        ),
        children: <InlineSpan>[
          WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: wid ?? const SizedBox()),
        ],
      ),
    );
  }
}
