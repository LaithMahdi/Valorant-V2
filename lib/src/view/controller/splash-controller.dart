import 'package:get/get.dart';
import '../../utils/constants/app-route.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offNamed(AppRoute.home),
    );
    super.onInit();
  }
}
