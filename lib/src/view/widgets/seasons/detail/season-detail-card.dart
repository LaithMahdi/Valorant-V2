import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/model/season/season-model.dart';
import '../../../../shared/widgets/spacer/spacer.dart';
import '../../../../utils/constants/app-color.dart';
import '../../../../utils/constants/app-size.dart';

class SeasonDetailCard extends StatelessWidget {
  final BorderModel border;
  const SeasonDetailCard({super.key, required this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.grey8),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            border.displayIcon!,
            color: AppColor.primary,
            fit: BoxFit.cover,
            width: AppSize.screenWidth! * .4,
            height: AppSize.screenHeight! * .2,
          ),
          const VerticalSpacer(.5),
          Text("Level : ${border.level} ", style: Get.textTheme.bodyMedium),
          const VerticalSpacer(1),
          Text("${border.winsRequired} wins", style: Get.textTheme.bodyMedium)
        ],
      ),
    );
  }
}
