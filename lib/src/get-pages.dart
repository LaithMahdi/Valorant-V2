import 'package:get/get.dart';
import 'utils/constants/app-route.dart';
import 'view/screens/home/home-screen.dart';
import 'view/screens/splash/splash-screen.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: AppRoute.splash, page: () => const SplashScreen()),
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),
];
