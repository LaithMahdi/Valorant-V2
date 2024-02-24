import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/app-color.dart';

class BtnBack extends StatelessWidget {
  const BtnBack({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: AppColor.primary,
        size: 18,
      ),
      onPressed: () => Get.back(),
    );
  }
}
