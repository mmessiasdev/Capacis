import 'package:Consult/component/colors.dart';
import 'package:Consult/component/padding.dart';
import 'package:Consult/component/texts.dart';
import 'package:Consult/view/courses/coursescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CourseContent extends StatelessWidget {
  CourseContent(
      {super.key,
      required this.drules,
      required this.title,
      this.urlLogo,
      this.maxl,
      this.over,
      this.bgcolor,
      required this.id});

  final String drules;
  final String title;
  final String? urlLogo;
  String id;
  int? maxl;
  TextOverflow? over;
  Color? bgcolor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GestureDetector(
        onTap: () {
          (Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CourseScreen(id: id)),
          ));
        },
        child: Container(
          decoration: BoxDecoration(
            color: bgcolor ?? lightColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color:
                    Colors.black.withOpacity(0.2), // Cor e opacidade da sombra
                spreadRadius: 2, // Expansão da sombra
                blurRadius: 5, // Desfoque
                offset: Offset(0, 3), // Deslocamento (horizontal, vertical)
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: urlLogo == ""
                    ? SizedBox()
                    : Image.network(
                        urlLogo ?? "",
                        fit: BoxFit.contain,
                      ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: defaultPadding,
                child: SecundaryText(
                  text: title,
                  color: nightColor,
                  align: TextAlign.start,
                  maxl: maxl,
                  over: over,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
