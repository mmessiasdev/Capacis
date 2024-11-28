import 'package:Consult/component/colors.dart';
import 'package:Consult/component/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class PlanContainer extends StatelessWidget {
  PlanContainer(
      {super.key,
      required this.name,
      required this.value,
      required this.rules,
      required this.onClick,
      required this.bgcolor,
      required this.benefit});

  String name;
  String value;
  String rules;
  String benefit;
  Function onClick;
  Color bgcolor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: GestureDetector(
          onTap: () {
            onClick();
          },
          child: ClipRRect(
            // esse widget
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: Colors.black, // Cor da borda preta
                  width: 2, // Largura da borda de 1 pixel
                ), // Adiciona a borda aqui
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      gradient: LinearGradient(
                        colors: [bgcolor, SecudaryColor],
                        begin: Alignment.topCenter, // Início do degradê
                        end: Alignment.bottomRight, // Fim do degradê
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 25),
                      child: SubText(
                        text: name,
                        align: TextAlign.center,
                        color: lightColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    child: Column(
                      children: [
                        PrimaryText(
                          color: nightColor,
                          text: "${value}R\$",
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SubText(
                            text: "${rules}".replaceAll("\\n", "\n\n"),
                            align: TextAlign.start),
                        SizedBox(
                          height: 30,
                        ),
                        Divider(),
                        SizedBox(
                          height: 30,
                        ),
                        SubText(text: "Benefícios:", align: TextAlign.center),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: [
                            SubText(
                                text: "${benefit}".replaceAll("\\n", "\n\n"),
                                color: OffColor,
                                align: TextAlign.start),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FourtyColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SubText(
                          color: lightColor,
                          text: "Contratar agora!",
                          align: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
