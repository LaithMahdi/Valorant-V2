import 'package:get/get.dart';
import 'utils/constants/app-route.dart';
import 'view/screens/agent/agent-screen.dart';
import 'view/screens/agent/detail/agent-detail-screen.dart';
import 'view/screens/home/home-screen.dart';
import 'view/screens/seasons/detail/season-detail-screen.dart';
import 'view/screens/seasons/season-screen.dart';
import 'view/screens/splash/splash-screen.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: AppRoute.splash, page: () => const SplashScreen()),
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),
  GetPage(name: AppRoute.agent, page: () => const AgentScreen()),
  GetPage(name: AppRoute.agentDetail, page: () => const AgentDetailScreen()),
  GetPage(name: AppRoute.season, page: () => const SeasonScreen()),
  GetPage(name: AppRoute.seasonDetail, page: () => const SeasonDetailScreen()),
];
