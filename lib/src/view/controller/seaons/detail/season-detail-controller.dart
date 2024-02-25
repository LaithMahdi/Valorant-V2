import 'package:fortnite/src/data/model/season/season-model.dart';
import 'package:get/get.dart';

class SeasonDetailController extends GetxController {
  late SeasonModel _season;

  // Getter
  SeasonModel get season => _season;
  @override
  void onInit() {
    _season = Get.arguments["season"];
    super.onInit();
  }
}
