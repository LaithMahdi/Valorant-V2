import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/home/home-model.dart';
import '../../../utils/constants/app-color.dart';
import '../../../utils/constants/app-size.dart';

class HomeCard extends StatelessWidget {
  final HomeModel item;
  final VoidCallback onTap;
  const HomeCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(item.image), fit: BoxFit.cover),
          border: Border.all(
              color: AppColor.light,
              width: 2,
              strokeAlign: BorderSide.strokeAlignInside),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        width: AppSize.screenWidth,
        height: AppSize.screenHeight! * 0.2,
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(15),
        child: Text(item.name, style: Get.textTheme.headlineMedium),
      ),
    );
  }
}
