import 'package:Consult/component/colors.dart';
import 'package:Consult/component/texts.dart';
import 'package:Consult/view/courses/coursescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContentProduct extends StatelessWidget {
  ContentProduct(
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
            width: 150,
            decoration: BoxDecoration(
              color: bgcolor ?? lightColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 75,
                    height: 100,
                    // child: Image.network(
                    //   urlLogo ?? "",
                    //   fit: BoxFit.contain,
                    // ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: FourtyColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SubText(
                        color: lightColor,
                        text: drules,
                        align: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SecundaryText(
                    text: title,
                    color: nightColor,
                    align: TextAlign.start,
                    maxl: maxl,
                    over: over,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
