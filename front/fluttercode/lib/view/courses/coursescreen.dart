import 'package:Consult/component/buttons.dart';
import 'package:Consult/component/colors.dart';
import 'package:Consult/component/padding.dart';
import 'package:Consult/component/texts.dart';
import 'package:Consult/component/tips.dart';
import 'package:Consult/component/widgets/header.dart';
import 'package:Consult/component/widgets/searchInput.dart';
import 'package:Consult/service/local/auth.dart';
import 'package:Consult/service/remote/auth.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {
  CourseScreen({super.key, required this.id});
  String id;

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  var client = http.Client();
  var email;
  var lname;
  var token;
  var id;
  var chunkId;
  var fileBytes;
  var fileName;

  @override
  void initState() {
    super.initState();
    getString();
  }

  void getString() async {
    var strToken = await LocalAuthService().getSecureToken("token");

    setState(() {
      token = strToken.toString();
    });
  }

  // Função para abrir o link
  Future<void> _launchURL(urlAff) async {
    if (!await launchUrl(urlAff, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $urlAff';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightColor,
        body: token == "null"
            ? const SizedBox()
            : ListView(
                children: [
                  FutureBuilder<Map>(
                      future: RemoteAuthService()
                          .getOneCourse(token: token, id: widget.id),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var render = snapshot.data!;
                          return SizedBox(
                            child: Padding(
                              padding: defaultPaddingHorizon,
                              child: Column(
                                children: [
                                  MainHeader(
                                      maxl: 1,
                                      title: render["title"],
                                      icon: Icons.arrow_back_ios,
                                      onClick: () {
                                        (Navigator.pop(context));
                                      }),
                                  Padding(
                                    padding: defaultPaddingVertical,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: SizedBox(
                                          child: Image.network(
                                              render["urlbanner"])),
                                    ),
                                  ),
                                  Padding(
                                    padding: defaultPaddingVertical,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        SubText(
                                          color: nightColor,
                                          text:
                                              "Tempo do curso: ${render["time"]} horas",
                                          align: TextAlign.end,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SubText(
                                          color: nightColor,
                                          text: "Nível: ${render["nivel"]}",
                                          align: TextAlign.end,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Padding(
                                    padding: defaultPaddingVertical,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Uri urlAff =
                                              Uri.parse(render["time"]);
                                          _launchURL(urlAff);
                                        });
                                      },
                                      child: DefaultButton(
                                        text: "Editar Curso",
                                        color: SeventhColor,
                                        padding: defaultPadding,
                                        colorText: lightColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Padding(
                                    padding: defaultPaddingVertical,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Uri urlAff =
                                              Uri.parse(render["time"]);
                                          _launchURL(urlAff);
                                        });
                                      },
                                      child: DefaultButton(
                                        text: "Remover Curso",
                                        color: FifthColor,
                                        padding: defaultPadding,
                                        colorText: lightColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Expanded(
                            child: Center(
                                child: SubText(
                              text: 'Erro ao pesquisar Store',
                              color: PrimaryColor,
                              align: TextAlign.center,
                            )),
                          );
                        }
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: PrimaryColor,
                            ),
                          ),
                        );
                      }),
                ],
              ),
      ),
    );
  }
}
