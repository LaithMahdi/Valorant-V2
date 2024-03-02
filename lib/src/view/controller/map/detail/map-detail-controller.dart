import 'package:fortnite/src/data/model/map/map-model.dart';
import 'package:get/get.dart';

class MapDetailController extends GetxController {
  late MapModel map;
  late String tag;

  @override
  void onInit() {
    map = Get.arguments["map"];
    tag = Get.arguments["tag"];
    super.onInit();
  }
}
