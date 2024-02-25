import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/widgets/buttons/btn-back.dart';
import '../../../../shared/widgets/spacer/spacer.dart';
import '../../../../utils/constants/app-image.dart';
import '../../../controller/seaons/detail/season-detail-controller.dart';
import '../../../widgets/seasons/detail/season-detail-card.dart';

class SeasonDetailScreen extends StatelessWidget {
  const SeasonDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SeasonDetailController controller = Get.put(SeasonDetailController());
    return Scaffold(
      appBar: AppBar(leading: const BtnBack()),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Hero(
              tag: controller.season.uuid!,
              child: Image.asset(AppImage.season_01, fit: BoxFit.cover),
            ),
            const VerticalSpacer(2),
            Expanded(
              child: GridView.builder(
                itemCount: controller.season.borders!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 7 / 9,
                ),
                itemBuilder: (context, index) =>
                    SeasonDetailCard(border: controller.season.borders![index]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
