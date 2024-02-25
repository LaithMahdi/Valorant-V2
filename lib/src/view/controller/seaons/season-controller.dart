import 'package:get/get.dart';
import '../../../data/model/season/season-model.dart';
import '../../../data/remote/season/season-data.dart';
import '../../../utils/class/status-request.dart';
import '../../../utils/constants/app-route.dart';
import '../../../utils/functions/handling-data.dart';

class SeasonController extends GetxController {
  StatusRequest _statusRequest = StatusRequest.none;
  final SeasonData _seasonData = SeasonData(Get.find());
  List<SeasonModel> _seasons = [];

  late String _name = "";

  // Getter
  String? get name => _name;
  StatusRequest get statusRequest => _statusRequest;
  SeasonData get seasonData => _seasonData;
  List<SeasonModel> get seasons => _seasons;

  @override
  void onInit() {
    _name = Get.arguments["name"];
    getSeasons();
    super.onInit();
  }

  Future<void> getSeasons() async {
    _statusRequest = StatusRequest.loading;
    update();
    var response = await _seasonData.getAllSeasons();
    _statusRequest = handlingData(response);
    if (_statusRequest == StatusRequest.loaded) {
      if (response != null && response["status"] == 200) {
        _seasons = List.generate(
          response["data"].length,
          (index) => SeasonModel.fromJson(response["data"][index]),
        );
        _seasons = _seasons.reversed.toList();
      } else {
        _statusRequest = StatusRequest.failure;
      }
    } else {
      _statusRequest = StatusRequest.failure;
    }
    update();
  }

  goToSeasonDetail(SeasonModel season) =>
      Get.toNamed(AppRoute.seasonDetail, arguments: {"season": season});
}
