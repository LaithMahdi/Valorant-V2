import 'package:get/get.dart';
import '../../../../data/model/weapon/weapon-model.dart';

class WeaponDetailController extends GetxController {
  late WeaponModel _weapon;

  // Getter
  WeaponModel get weapon => _weapon;
  @override
  void onInit() {
    _weapon = Get.arguments["weapon"];
    super.onInit();
  }

  Map<String, dynamic> get weaponMap => {
        "Weapon name": _weapon.displayName,
        "Creds": _weapon.shopData!.cost,
        "Magazine": _weapon.weaponStats!.magazineSize,
        "Wall Penetration": _weapon.weaponStats!.wallPenetration ==
                "EWallPenetrationDisplayType::High"
            ? "High"
            : "Low",
        "Fire Rate": "${_weapon.weaponStats!.fireRate}/sec",
        "Category": _weapon.shopData!.category,
        "Fire Mode": _weapon.weaponStats!.fireMode == null
            ? "FullAutomatic"
            : "SemiAutomatic",
      };

  Map<String, dynamic> get weaponStatMap => {
        "Run Speed Multiplier": _weapon.weaponStats!.runSpeedMultiplier,
        "Equip Time Seconds": _weapon.weaponStats!.equipTimeSeconds,
        "Reload Time Seconds": _weapon.weaponStats!.reloadTimeSeconds,
        "First Bullet Accuracy": _weapon.weaponStats!.firstBulletAccuracy,
        "ADS Zoom Multiplier": _weapon.weaponStats!.adsStats!.zoomMultiplier,
        "ADS Fire Rate": _weapon.weaponStats!.adsStats!.fireRate,
        "ADS Run Speed Multiplier":
            _weapon.weaponStats!.adsStats!.runSpeedMultiplier,
        "ADS First Bullet Accuracy":
            _weapon.weaponStats!.adsStats!.firstBulletAccuracy,
        "ADS Burst Count": _weapon.weaponStats!.adsStats!.burstCount,
      };
}
