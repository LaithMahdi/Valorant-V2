import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/map/map-model.dart';
import '../../../shared/widgets/buttons/btn-back.dart';
import '../../../shared/widgets/loading/loading-state.dart';
import '../../../shared/widgets/spacer/spacer.dart';
import '../../controller/map/map-controller.dart';
import '../../widgets/map/map-card.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MapController controller = Get.put(MapController());
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.name),
          leading: const BtnBack(),
        ),
        body: GetBuilder<MapController>(
          builder: (controller) => LoadingState(
            status: controller.statusRequest,
            widget: ListView.separated(
              padding: const EdgeInsets.all(15),
              separatorBuilder: (context, index) => const VerticalSpacer(2),
              itemBuilder: (context, index) {
                MapModel map = controller.maps[index];
                return MapCard(
                    map: map,
                    onTap: () => controller.goToDetail(map, map.splash!));
              },
              itemCount: controller.maps.length,
            ),
          ),
        ));
  }
}
