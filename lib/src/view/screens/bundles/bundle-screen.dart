import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/widgets/buttons/btn-back.dart';
import '../../../shared/widgets/loading/loading-state.dart';
import '../../../shared/widgets/spacer/spacer.dart';
import '../../controller/bundle/bundle-controller.dart';
import '../../widgets/bundle/bundle-card.dart';

class BundleScreen extends StatelessWidget {
  const BundleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BundleController controller = Get.put(BundleController());
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.name),
        leading: const BtnBack(),
      ),
      body: GetBuilder<BundleController>(
        builder: (controller) => LoadingState(
          status: controller.statusRequest,
          widget: ListView.separated(
            padding: const EdgeInsets.all(15),
            itemBuilder: (context, index) =>
                BundleCard(bundle: controller.bundles[index]),
            separatorBuilder: (context, index) => const VerticalSpacer(3),
            itemCount: controller.bundles.length,
          ),
        ),
      ),
    );
  }
}
