import 'package:fortnite/src/data/model/map/map-model.dart';
import 'package:fortnite/src/utils/class/status-request.dart';
import 'package:get/get.dart';

import '../../../data/remote/map/map-data.dart';
import '../../../utils/constants/app-route.dart';
import '../../../utils/functions/handling-data.dart';

class MapController extends GetxController {
  StatusRequest _statusRequest = StatusRequest.loading;
  final MapData _mapData = MapData(Get.find());
  List<MapModel> _maps = [];
  late String _name = "";

  // Getter
  StatusRequest get statusRequest => _statusRequest;
  List<MapModel> get maps => _maps;
  String get name => _name;

  @override
  onInit() {
    getAgents();
    _name = Get.arguments["name"];
    super.onInit();
  }

  Future<void> getAgents() async {
    _statusRequest = StatusRequest.loading;
    update();
    var response = await _mapData.getAllMaps();
    _statusRequest = handlingData(response);
    if (_statusRequest == StatusRequest.loaded) {
      if (response != null && response["status"] == 200) {
        _maps = List.generate(
          response["data"].length,
          (index) => MapModel.fromJson(response["data"][index]),
        );
      } else {
        _statusRequest = StatusRequest.failure;
      }
    } else {
      _statusRequest = StatusRequest.failure;
    }
    update();
  }

  goToDetail(MapModel map, String tag) {
    Get.toNamed(AppRoute.mapDetail, arguments: {"map": map, "tag": tag});
  }
}
