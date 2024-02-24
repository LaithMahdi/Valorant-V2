import 'package:get/get.dart';

class HomeController extends GetxController {
  goToScreen(String route, String name) =>
      Get.toNamed(route, arguments: {"name": name});
}
