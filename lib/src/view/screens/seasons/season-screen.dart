import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/widgets/buttons/btn-back.dart';
import '../../../shared/widgets/loading/loading-state.dart';
import '../../../shared/widgets/spacer/spacer.dart';
import '../../controller/seaons/season-controller.dart';
import '../../widgets/seasons/season-card.dart';

class SeasonScreen extends StatelessWidget {
  const SeasonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SeasonController controller = Get.put(SeasonController());
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.name!),
        leading: const BtnBack(),
      ),
      body: GetBuilder<SeasonController>(
        builder: (controller) => LoadingState(
          status: controller.statusRequest,
          widget: ListView.separated(
            padding: const EdgeInsets.all(15),
            itemBuilder: (context, index) => SeasonCard(
              season: controller.seasons[index],
              onTap: () =>
                  controller.goToSeasonDetail(controller.seasons[index]),
            ),
            separatorBuilder: (context, index) => const VerticalSpacer(3),
            itemCount: controller.seasons.length,
          ),
        ),
      ),
    );
  }
}
