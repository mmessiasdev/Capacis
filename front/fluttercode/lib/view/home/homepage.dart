import 'package:Consult/component/buttons.dart';
import 'package:Consult/component/containersLoading.dart';
import 'package:Consult/component/contentproduct.dart';
import 'package:Consult/component/inputdefault.dart';
import 'package:Consult/component/widgets/header.dart';
import 'package:Consult/component/widgets/iconlist.dart';
import 'package:Consult/component/widgets/searchInput.dart';
import 'package:Consult/controller/auth.dart';
import 'package:Consult/model/courses.dart';
import 'package:Consult/service/remote/auth.dart';
import 'package:Consult/view/account/account.dart';
import 'package:Consult/view/courses/addcourse.dart';
import 'package:flutter/material.dart';
import 'package:Consult/component/colors.dart';
import 'package:Consult/component/padding.dart';
import 'package:Consult/component/texts.dart';
import 'package:Consult/service/local/auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var client = http.Client();

  String screen = "online";
  bool isButtonEnabled = false;

  String? token;
  String? fname;
  String? fullname;
  String? colaboratorId;

  var id;
  bool public = false;

  @override
  void initState() {
    super.initState();
    getString();
  }

  void getString() async {
    var strToken = await LocalAuthService().getSecureToken("token");
    var strfullname = await LocalAuthService().getFullName("fullname");

    if (mounted) {
      setState(() {
        token = strToken;
        fullname = strfullname;
      });
    }
  }

  TextEditingController cpf = TextEditingController();

  Widget ManutentionErro() {
    return ErrorPost(
      text: "Estamos passando por uma manutenção. Entre novamente mais tarde!",
    );
  }

  void _showDraggableScrollableSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return Container(
                color: Colors.white,
                child: Padding(
                  padding: defaultPadding,
                  child: Container(
                    decoration: BoxDecoration(
                        color: SecudaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: GestureDetector(
                      onTap: () {
                        (
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddCourseScreen()),
                          ),
                        );
                      },
                      child: Padding(
                        padding: defaultPadding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.person),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                SubText(
                                  text: 'Meu Perfil',
                                  align: TextAlign.start,
                                  color: nightColor,
                                ),
                                SubTextSized(
                                  text:
                                      'Verificar informações e sair da conta',
                                  size: 10,
                                  fontweight: FontWeight.w600,
                                  color: OffColor,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(token);
    print(fullname);
    return token == null
        ? const SizedBox()
        : SafeArea(
            child: SizedBox(
              child: Column(
                children: [
                  Padding(
                    padding: defaultPaddingHorizon,
                    child: MainHeader(
                      title: fullname.toString(),
                      icon: Icons.menu,
                      maxl: 2,
                      onClick: () => _showDraggableScrollableSheet(context),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: defaultPaddingHorizon,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SearchInput(),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconList(
                                onClick: () {},
                                icon: Icons.movie,
                                title: "Nossos cursos"),
                            IconList(
                                onClick: () {},
                                icon: Icons.people,
                                title: "Colaboradores"),
                            IconList(
                              onClick: () {},
                              icon: Icons.person_pin_circle_sharp,
                              title: "Indicadores",
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            (
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddCourseScreen()),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: PrimaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: defaultPadding,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.add),
                                  SubText(
                                      text: "Adicionar Curso",
                                      align: TextAlign.start)
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 250, // Altura definida para o ListView
                          child: FutureBuilder<List<CoursesModel>>(
                            future:
                                RemoteAuthService().getCourses(token: token),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                      ConnectionState.done &&
                                  snapshot.hasData) {
                                if (snapshot.data!.isEmpty) {
                                  return const Center(
                                    child: Text(
                                        "Nenhuma loja disponível no momento."),
                                  );
                                } else {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      var renders = snapshot.data![index];
                                      return ContentProduct(
                                        urlLogo: renders.title.toString(),
                                        drules: "${renders.desc}",
                                        title: renders.time.toString(),
                                        id: renders.id.toString(),
                                      );
                                    },
                                  );
                                }
                              } else if (snapshot.hasError) {
                                return WidgetLoading();
                              }
                              return SizedBox(
                                height: 300,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: nightColor,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        // Row(
                        //   children: [
                        //     CircleAvatar(
                        //       child: Icon(
                        //         Icons.people,
                        //         color: lightColor,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 15,
                        //     ),
                        //     RichDefaultText(
                        //       text: 'Olá, \n',
                        //       size: 20,
                        //       wid: SecundaryText(
                        //           text: '${fullname.toString()}!',
                        //           color: nightColor,
                        //           align: TextAlign.start),
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          );
  }
}
