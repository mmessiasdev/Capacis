import 'package:Consult/component/padding.dart';
import 'package:Consult/component/widgets/infotext.dart';
import 'package:Consult/component/widgets/title.dart';
import 'package:Consult/service/local/auth.dart';
import 'package:flutter/material.dart';
import 'package:Consult/controller/controllers.dart';

import '../../component/defaultTitleButtom.dart';
import '../../component/colors.dart';
import 'auth/signin.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key? key, required this.buttom}) : super(key: key);
  bool buttom;

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  var email;
  var fullname;
  var cpf;
  var id;
  var token;

  @override
  void initState() {
    super.initState();
    getString();
  }

  void getString() async {
    var strEmail = await LocalAuthService().getEmail("email");
    var strFullname = await LocalAuthService().getFullName("fullname");
    var strId = await LocalAuthService().getId("id");
    var strToken = await LocalAuthService().getSecureToken("token");

    if (mounted) {
      setState(() {
        email = strEmail.toString();
        fullname = strFullname.toString();
        id = strId.toString();
        token = strToken.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightColor,
      child: Padding(
        padding: defaultPaddingHorizon,
        child: ListView(
          children: [
            DefaultTitle(
              buttom: widget.buttom,
              title: "Seu perfil.",
            ),
            Column(
              children: [
                InfoText(
                  title: "Nome:",
                  stitle: fullname == "null" ? "" : fullname,
                  icon: Icons.people,
                ),
                SizedBox(
                  height: 20,
                ),
                InfoText(
                  title: "Email:",
                  stitle: email == "null" ? "" : email,
                  icon: Icons.email,
                ),
                SizedBox(
                  height: 20,
                ),
                // InfoText(title: "Username:", stitle: cpf == "null" ? "" : cpf),
                SizedBox(
                  height: 70,
                ),
                DefaultTitleButton(
                  title: email == "null" ? "Entrar na conta" : "Sair da conta",
                  onClick: () {
                    if (token != "null") {
                      authController.signOut();
                      // Navigator.pop(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const SignInScreen(),
                      //   ),
                      // );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    }
                  },
                  color: FifthColor,
                  iconColor: lightColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
