import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app-color.dart';

class ThemeService extends GetxController {
  ThemeData darkTheme = ThemeData(
    fontFamily: "Valorant",
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.dark,
    appBarTheme: AppBarTheme(
      color: AppColor.dark,
      centerTitle: true,
      scrolledUnderElevation: 0,
      elevation: 0,
      titleTextStyle: Get.textTheme.headlineLarge!.copyWith(
        fontFamily: "Valorant",
      ),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColor.primary),
    tabBarTheme: TabBarTheme(
      dividerColor: AppColor.grey8,
      dividerHeight: 4,
      indicatorColor: AppColor.primary,
      labelColor: AppColor.primary,
      labelStyle: Get.textTheme.bodyLarge!
          .copyWith(fontSize: 15, fontWeight: FontWeight.w600),
      tabAlignment: TabAlignment.start,
      unselectedLabelColor: AppColor.grey8,
      unselectedLabelStyle: Get.textTheme.bodyLarge,
      splashFactory: NoSplash.splashFactory,
    ),
    textTheme: const TextTheme(
      displaySmall: TextStyle(
          fontSize: 36,
          fontFamily: "Bebas Neue",
          fontWeight: FontWeight.bold,
          color: AppColor.light),
      headlineLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.light,
      ),
      headlineMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColor.light,
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColor.light,
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColor.light,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColor.light,
      ),
      bodySmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: AppColor.light,
      ),
    ),
  );
}
