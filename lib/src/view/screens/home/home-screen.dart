import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/local/home/home-items.dart';
import '../../../data/model/home/home-model.dart';
import '../../../shared/widgets/spacer/spacer.dart';
import '../../controller/home/home-controller.dart';
import '../../widgets/home/home-card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: ListView.separated(
        padding: const EdgeInsets.all(15),
        itemBuilder: (context, index) {
          HomeModel item = homeItems[index];
          return HomeCard(
            item: item,
            onTap: () => controller.goToScreen(item.route, item.name),
          );
        },
        separatorBuilder: (context, index) => const VerticalSpacer(3),
        itemCount: homeItems.length,
      ),
    );
  }
}
