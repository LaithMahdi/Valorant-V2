import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../shared/widgets/buttons/btn-back.dart';
import '../../../../shared/widgets/spacer/spacer.dart';
import '../../../../utils/constants/app-color.dart';
import '../../../../utils/constants/app-image.dart';
import '../../../../utils/constants/app-size.dart';
import '../../../controller/weapon/detail/weapon-detail-controller.dart';
import '../../../widgets/weapon/detail/weapon-table-damage.dart';
import '../../../widgets/weapon/detail/weapon-table-information.dart';

class WeaponDetailScreen extends StatelessWidget {
  const WeaponDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeaponDetailController controller = Get.put(WeaponDetailController());
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AppImage.logo, color: AppColor.primary),
        leading: const BtnBack(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const VerticalSpacer(2),
          Hero(
            tag: controller.weapon.displayIcon!,
            child: CachedNetworkImage(
              imageUrl: controller.weapon.displayIcon!,
              width: AppSize.screenWidth,
              fit: BoxFit.fill,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          ),
          const VerticalSpacer(4),
          Text("information",
              textAlign: TextAlign.center,
              style: Get.textTheme.headlineMedium!
                  .copyWith(color: AppColor.primary)),
          const VerticalSpacer(2),
          WeaponTableInformation(
              map: controller.weaponMap, color: AppColor.primary),
          const VerticalSpacer(3),
          Text("Damage",
              textAlign: TextAlign.center,
              style: Get.textTheme.headlineMedium!
                  .copyWith(color: AppColor.primary)),
          const VerticalSpacer(2),
          const WeaponTableDamage(),
          const VerticalSpacer(4),
          Text("Weapon details",
              textAlign: TextAlign.center,
              style: Get.textTheme.headlineMedium!
                  .copyWith(color: AppColor.primary)),
          const VerticalSpacer(2),
          WeaponTableInformation(
              map: controller.weaponStatMap, color: AppColor.grey8),
        ],
      ),
    );
  }
}
