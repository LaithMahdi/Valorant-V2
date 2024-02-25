import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import '../../../data/model/season/season-model.dart';
import '../../../shared/widgets/spacer/spacer.dart';
import '../../../utils/constants/app-color.dart';
import '../../../utils/constants/app-image.dart';
import '../../../utils/constants/app-size.dart';

class SeasonCard extends StatelessWidget {
  final SeasonModel season;
  final VoidCallback onTap;
  const SeasonCard({super.key, required this.season, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: season.uuid!,
        child: Container(
          height: AppSize.screenHeight! * 0.25,
          width: AppSize.screenWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImage.season_01),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                alignment: Alignment.topRight,
                child: SvgPicture.asset(AppImage.logo,
                    color: AppColor.primary, height: 30, width: 30),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                alignment: Alignment.bottomRight,
                height: AppSize.screenHeight! * 0.1,
                decoration: BoxDecoration(
                  color: AppColor.dark.withOpacity(0.3),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.swap_vert,
                        color: AppColor.light, size: 30),
                    const HorizintalSpacer(1),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Jiffy.parse(season.startTime!).yMMMMEEEEdjm,
                            style: Get.textTheme.bodyMedium),
                        const VerticalSpacer(1),
                        Text(Jiffy.parse(season.endTime!).yMMMMEEEEdjm,
                            style: Get.textTheme.bodyMedium),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
