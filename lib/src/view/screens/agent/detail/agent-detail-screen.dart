import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../shared/widgets/buttons/btn-back.dart';
import '../../../../utils/constants/app-color.dart';
import '../../../../utils/constants/app-image.dart';
import '../../../../utils/constants/app-size.dart';
import '../../../controller/agent/detail/agent-detail-controller.dart';
import '../../../widgets/agent/detail/agent-detail-description.dart';

class AgentDetailScreen extends StatelessWidget {
  const AgentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AgentDetailController controller = Get.put(AgentDetailController());
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          AppImage.logo,
          color: AppColor.primary,
        ),
        leading: const BtnBack(),
      ),
      body: SizedBox(
        height: AppSize.screenHeight,
        width: AppSize.screenWidth,
        child: Stack(
          children: [
            Positioned(
              right: 30,
              top: 30,
              left: 30,
              child: CachedNetworkImage(
                imageUrl: controller.agent.background!,
                height: AppSize.screenHeight! * .35,
                width: AppSize.screenWidth,
                color: AppColor.primary,
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: controller.tag,
                child: CachedNetworkImage(
                  imageUrl: controller.agent.fullPortrait!,
                  height: AppSize.screenHeight! * .4,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Positioned(
              top: AppSize.screenHeight! * .44,
              bottom: 0,
              right: 15,
              left: 15,
              child: const AgentDetailDescription(),
            ),
          ],
        ),
      ),
    );
  }
}
