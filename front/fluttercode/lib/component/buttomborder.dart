import 'package:flutter/material.dart';
import 'package:Consult/component/texts.dart';
import 'package:google_fonts/google_fonts.dart';

class InputOutlineButton extends StatelessWidget {
  final String title;
  final Function onClick;
  const InputOutlineButton(
      {Key? key, required this.title, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: GoogleFonts.montserrat(
          fontSize: 20,
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 0, 0, 0),
            decoration: TextDecoration.none,
          ),
        ),
        foregroundColor: Color.fromRGBO(0, 0, 0, 1),
        minimumSize: const Size(double.maxFinite, 45),
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            side: BorderSide(
              color: Colors.grey,
            )),
      ),
      onPressed: () {
        FocusScope.of(context).requestFocus(FocusNode());
        onClick();
      },
      child: ButtomSecundary(text: title),
    );
  }
}
