import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/get-pages.dart';
import 'src/utils/bindings/initial-binding.dart';
import 'src/utils/constants/app-size.dart';
import 'src/utils/constants/app-string.dart';
import 'src/utils/constants/app-theme.dart';
import 'src/utils/service/my-services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetMaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeService().darkTheme,
      getPages: getPages,
      initialBinding: InitialBindings(),
    );
  }
}
