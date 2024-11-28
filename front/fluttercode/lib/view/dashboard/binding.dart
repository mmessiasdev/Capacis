import 'package:get/get.dart';
import 'package:Consult/controller/auth.dart';
import 'package:Consult/controller/dashboard.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(AuthController());
  }
}