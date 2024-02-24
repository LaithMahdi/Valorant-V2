import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../utils/constants/app-color.dart';
import '../../../utils/constants/app-image.dart';
import '../../../utils/constants/app-string.dart';
import '../../controller/splash/splash-controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(AppImage.logo,
                color: AppColor.primary, width: 60),
          ),
          Text(
            AppString.appName,
            style: Get.textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
