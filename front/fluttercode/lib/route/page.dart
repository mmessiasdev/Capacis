import 'package:Consult/route/route.dart';
import 'package:Consult/view/account/auth/signin.dart';
import 'package:Consult/view/dashboard/binding.dart';
import 'package:Consult/view/dashboard/screen.dart';
import 'package:get/get.dart';

class AppPage {
  static var list = [
    GetPage(
      name: AppRoute.dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoute.loginIn,
      page: () => const SignInScreen(),
    ),
  ];
}
