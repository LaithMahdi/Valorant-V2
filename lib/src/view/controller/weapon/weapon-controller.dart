import 'package:get/get.dart';
import '../../../data/model/weapon/weapon-model.dart';
import '../../../data/remote/weapon/weapon-data.dart';
import '../../../utils/class/status-request.dart';
import '../../../utils/constants/app-route.dart';
import '../../../utils/functions/handling-data.dart';

class WeaponController extends GetxController {
  StatusRequest _statusRequest = StatusRequest.none;
  final WeaponData _weaponData = WeaponData(Get.find());
  List<WeaponModel> _weapons = [];

  late String _name;

  // Getter
  String? get name => _name;
  StatusRequest get statusRequest => _statusRequest;
  WeaponData get weaponData => _weaponData;
  List<WeaponModel> get weapons => _weapons;

  @override
  onInit() {
    _name = Get.arguments["name"];
    getWeapons();
    super.onInit();
  }

  Future<void> getWeapons() async {
    _statusRequest = StatusRequest.loading;
    update();
    var response = await _weaponData.getAllWeapons();
    _statusRequest = handlingData(response);
    if (_statusRequest == StatusRequest.loaded) {
      if (response != null && response["status"] == 200) {
        _weapons = List.generate(
          response["data"].length,
          (index) => WeaponModel.fromJson(response["data"][index]),
        );
      } else {
        _statusRequest = StatusRequest.failure;
      }
    } else {
      _statusRequest = StatusRequest.failure;
    }
    update();
  }

  goToSeasonDetail(WeaponModel weapon) =>
      Get.toNamed(AppRoute.weaponDetail, arguments: {"weapon": weapon});
}
