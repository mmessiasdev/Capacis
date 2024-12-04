import 'package:Consult/component/colors.dart';
import 'package:Consult/component/contentproduct.dart';
import 'package:Consult/component/padding.dart';
import 'package:Consult/component/widgets/header.dart';
import 'package:Consult/model/profiles.dart';
import 'package:Consult/service/local/auth.dart';
import 'package:Consult/service/remote/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  var token;
  var idInterprise;

  @override
  void initState() {
    super.initState();
    getString();
  }

  void getString() async {
    var strToken = await LocalAuthService().getSecureToken("token");
    var strIdInterprise =
        await LocalAuthService().getIdInterprise("idInterprise");

    setState(() {
      token = strToken.toString();
      idInterprise = strIdInterprise.toString();
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
                  title: "Colaboradores",
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
              child: FutureBuilder<List<ProfilesModel>>(
                  future: RemoteAuthService().getEnterpriseProfiles(
                      token: token,
                      id: idInterprise.toString() ?? 1.toString()),
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
                                  urlLogo: renders.fullname,
                                  drules: "${renders.email}",
                                  title: renders.id.toString(),
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
