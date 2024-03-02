import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../shared/widgets/buttons/btn-back.dart';
import '../../../../utils/constants/app-color.dart';
import '../../../../utils/constants/app-image.dart';
import '../../../../utils/constants/app-size.dart';
import '../../../controller/map/detail/map-detail-controller.dart';

class MapDetailScreen extends StatelessWidget {
  const MapDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MapDetailController controller = Get.put(MapDetailController());
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AppImage.logo, color: AppColor.primary),
        leading: const BtnBack(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                left: 0,
                right: AppSize.screenWidth! * .6,
                child: const Divider(
                    color: AppColor.primary, thickness: 3, height: 2)),
            Positioned(
              top: 15,
              left: 0,
              right: 0,
              child: Hero(
                tag: controller.tag,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: CachedNetworkImage(
                      imageUrl: controller.map.splash!,
                      height: AppSize.screenHeight! * .3,
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              top: AppSize.screenHeight! * .27,
              left: 12,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.map.displayName!,
                      style:
                          Get.textTheme.displaySmall!.copyWith(fontSize: 60)),
                  Text(controller.map.narrativeDescription!,
                      style: Get.textTheme.bodyLarge!
                          .copyWith(fontFamily: "Bebas Neue")),
                ],
              ),
            ),
            Positioned(
              right: 0,
              left: AppSize.screenWidth! * .6,
              top: AppSize.screenHeight! * .5,
              child: const Divider(
                  color: AppColor.primary, thickness: 3, height: 2),
            ),
            Positioned(
              top: AppSize.screenHeight! * .51,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: CachedNetworkImage(
                    imageUrl: controller.map.displayIcon!,
                    height: AppSize.screenHeight! * .3,
                    fit: BoxFit.fill),
              ),
            ),
            Positioned(
              right: 0,
              left: AppSize.screenWidth! * .6,
              bottom: 0,
              child: const Divider(
                  color: AppColor.primary, thickness: 5, height: 2),
            ),
            Positioned(
                right: 0,
                left: AppSize.screenWidth! * .55,
                bottom: 5,
                child: Text("MINI MAP",
                    style: Get.textTheme.displaySmall!
                        .copyWith(letterSpacing: 0, fontSize: 45))),
          ],
        ),
      ),
    );
  }
}
