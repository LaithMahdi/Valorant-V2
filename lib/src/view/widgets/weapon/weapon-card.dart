import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/weapon/weapon-model.dart';
import '../../../utils/constants/app-color.dart';
import '../../../utils/constants/app-size.dart';

class WeaponCard extends StatelessWidget {
  final WeaponModel weapon;
  final VoidCallback onTap;
  // final String tag;
  const WeaponCard({
    super.key,
    required this.weapon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: weapon.displayIcon!,
        child: Container(
          height: AppSize.screenHeight! * .2,
          width: AppSize.screenWidth,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.grey8, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                bottom: 10,
                left: 20,
                right: 20,
                child: CachedNetworkImage(
                  imageUrl: weapon.displayIcon!,
                  width: AppSize.screenWidth! * .6,
                  height: AppSize.screenHeight! * .2,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
              Positioned(
                bottom: 15,
                left: 15,
                child: Text(weapon.displayName!,
                    style: Get.textTheme.headlineMedium!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
