import 'dart:convert';

import 'package:Consult/component/colors.dart';
import 'package:Consult/component/texts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BankCard extends StatelessWidget {
  BankCard(
      {super.key,
      this.logo,
      this.urllogo,
      this.qrCode,
      required this.name,
      required this.cpf});

  String? urllogo;
  String? qrCode;
  String name;
  String cpf;
  String? logo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [SecudaryColor, PrimaryColor],
            begin: Alignment.topCenter, // Início do degradê
            end: Alignment.bottomRight, // Fim do degradê
          ),
          borderRadius: BorderRadius.circular(17)),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubTextSized(
                      text: "Consult", size: 30, fontweight: FontWeight.w600),
                  SubText(
                      text: "Seu cartão de benefícios", align: TextAlign.start, color: OffColor,),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubText(text: name, align: TextAlign.start),
                      SecundaryText(
                          maxl: 1,
                          over: TextOverflow.fade,
                          text: cpf,
                          color: nightColor,
                          align: TextAlign.start),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            if (qrCode != null && qrCode!.startsWith('data:image'))
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child:
                      SizedBox(child: _buildQrCodeImage(qrCode!, logo ?? "")),
                ),
              )
            else
              SizedBox(
                height: 200,
              )
          ],
        ),
      ),
    );
  }
}

Widget _buildQrCodeImage(String base64String, String logo) {
  // Remove a parte 'data:image/png;base64,' da string
  final decodedBytes =
      base64Decode(base64String.split(',').last); // Decodifica a string Base64

  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Container(
      color: lightColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.network(
              logo,
              fit: BoxFit.contain,
              width: 60,
              height: 60,
            ),
            SizedBox(
              height: 20,
            ),
            Image.memory(
              decodedBytes,
              fit: BoxFit.contain,
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    ),
  );
}
