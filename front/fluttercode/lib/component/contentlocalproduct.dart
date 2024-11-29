import 'package:Consult/component/colors.dart';
import 'package:Consult/component/padding.dart';
import 'package:Consult/component/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContentLocalProduct extends StatelessWidget {
  ContentLocalProduct(
      {super.key,
      required this.benefit,
      required this.title,
      this.urlLogo,
      required this.id});

  final String benefit;
  final String title;
  final String? urlLogo;
  String id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        // onTap: () {
        //   (Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => LocalStoreScreen(id: id)),
        //   ));
        // },
        child: Container(
            decoration: BoxDecoration(
              color: SixthColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: defaultPadding,
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Image.network(
                      urlLogo ?? "",
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              color: PrimaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SubText(
                                color: lightColor,
                                text: benefit,
                                align: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            child: SubText(
                              //esse widget
                              text: title,
                              color: nightColor,
                              align: TextAlign.start,
                              over: TextOverflow.fade,
                              maxl: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
