import 'package:Consult/component/colors.dart';
import 'package:Consult/component/contentproduct.dart';
import 'package:Consult/component/padding.dart';
import 'package:Consult/component/widgets/header.dart';
import 'package:Consult/component/widgets/plancontainer.dart';
import 'package:Consult/model/courses.dart';
import 'package:Consult/service/local/auth.dart';
import 'package:Consult/service/remote/auth.dart';
import 'package:Consult/view/courses/coursescreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OurCourses extends StatefulWidget {
  const OurCourses({super.key});

  @override
  State<OurCourses> createState() => _OurCoursesState();
}

class _OurCoursesState extends State<OurCourses> {
  var token;

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightColor,
        body: ListView(
          children: [
            Padding(
              padding: defaultPaddingHorizon,
              child: MainHeader(
                  title: "Nossos Planos!",
                  maxl: 1,
                  icon: Icons.arrow_back_ios,
                  onClick: () {
                    Navigator.pop(context);
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: FutureBuilder<List<CoursesModel>>(
                  future: RemoteAuthService().getCourses(token: token),
                  builder: (context, planSnapshot) {
                    if (planSnapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: planSnapshot.data!.length,
                          itemBuilder: (context, index) {
                            var renders = planSnapshot.data![index];
                            if (renders != null) {
                              return Padding(
                                padding: defaultPaddingHorizon,
                                child: ContentProduct(
                                  urlLogo: renders.urlbanner.toString(),
                                  drules: "${renders.desc}",
                                  title: renders.time.toString(),
                                  id: renders.id.toString(),
                                ),
                              );
                            }
                            return const SizedBox(
                              height: 100,
                              child: Center(
                                child: Text('Plano não encontrado'),
                              ),
                            );
                          });
                    }
                    return SizedBox(
                      height: 300,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: nightColor,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
