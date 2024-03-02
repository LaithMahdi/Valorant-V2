import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/weapon/weapon-model.dart';
import '../../../shared/widgets/buttons/btn-back.dart';
import '../../../shared/widgets/loading/loading-state.dart';
import '../../../shared/widgets/spacer/spacer.dart';
import '../../controller/weapon/weapon-controller.dart';
import '../../widgets/weapon/weapon-card.dart';

class WeaponScreen extends StatelessWidget {
  const WeaponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeaponController controller = Get.put(WeaponController());
    return Scaffold(
      appBar: AppBar(title: Text(controller.name!), leading: const BtnBack()),
      body: GetBuilder<WeaponController>(
        builder: (controller) => LoadingState(
          status: controller.statusRequest,
          widget: ListView.separated(
            padding: const EdgeInsets.all(15),
            itemBuilder: (context, index) {
              WeaponModel weapon = controller.weapons[index];
              return WeaponCard(
                weapon: weapon,
                onTap: () => controller.goToSeasonDetail(weapon),
              );
            },
            separatorBuilder: (context, index) => const VerticalSpacer(2),
            itemCount: controller.weapons.length,
          ),
        ),
      ),
    );
  }
}
