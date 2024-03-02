import '../../../utils/constants/app-image.dart';
import '../../../utils/constants/app-route.dart';
import '../../model/home/home-model.dart';

List<HomeModel> homeItems = [
  HomeModel(
      id: 1, name: "Agents", image: AppImage.agent, route: AppRoute.agent),
  HomeModel(
      id: 2, name: "Seasons", image: AppImage.season, route: AppRoute.season),
  HomeModel(id: 3, name: "Maps", image: AppImage.map, route: AppRoute.map),
  HomeModel(
      id: 4, name: "Weapons", image: AppImage.weapon, route: AppRoute.weapon),
  HomeModel(
      id: 5, name: "Bundles", image: AppImage.bundle, route: AppRoute.bundle),
];
