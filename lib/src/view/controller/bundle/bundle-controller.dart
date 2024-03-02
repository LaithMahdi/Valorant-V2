import 'package:fortnite/src/data/model/bundle/bundle-model.dart';
import 'package:fortnite/src/data/remote/bundle/bundle-data.dart';
import 'package:fortnite/src/utils/class/status-request.dart';
import 'package:get/get.dart';

import '../../../utils/functions/handling-data.dart';

class BundleController extends GetxController {
  StatusRequest _statusRequest = StatusRequest.loading;
  final BundleData _bundleData = BundleData(Get.find());
  List<BundleModel> _bundles = [];
  late String _name;

  // Getter
  String get name => _name;
  StatusRequest get statusRequest => _statusRequest;
  List<BundleModel> get bundles => _bundles;

  @override
  void onInit() {
    _name = Get.arguments["name"];
    getBundles();
    super.onInit();
  }

  Future<void> getBundles() async {
    _statusRequest = StatusRequest.loading;
    update();
    var response = await _bundleData.getAllBundles();
    _statusRequest = handlingData(response);
    if (_statusRequest == StatusRequest.loaded) {
      if (response != null && response["status"] == 200) {
        _bundles = List.generate(
          response["data"].length,
          (index) => BundleModel.fromJson(response["data"][index]),
        );
      } else {
        _statusRequest = StatusRequest.failure;
      }
    } else {
      _statusRequest = StatusRequest.failure;
    }
    update();
  }
}
