import 'package:flutter/material.dart';
import 'package:fortnite/src/utils/constants/app-color.dart';
import 'package:get/get.dart';
import 'src/get-pages.dart';
import 'src/utils/constants/app-string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Valorant",
        primaryColor: AppColor.primary,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.light,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      getPages: getPages,
    );
  }
}
