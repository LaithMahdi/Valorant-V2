import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../data/model/agent/agent-model.dart';
import '../../../../shared/widgets/buttons/btn-back.dart';
import '../../../../shared/widgets/spacer/spacer.dart';
import '../../../../utils/constants/app-color.dart';
import '../../../../utils/constants/app-image.dart';
import '../../../../utils/constants/app-size.dart';
import '../../../controller/agent/detail/agent-detail-controller.dart';

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
            leading: const BtnBack()),
        body: SizedBox(
          height: AppSize.screenHeight,
          child: Stack(
            children: [
              Positioned(
                top: -20,
                right: 0,
                left: 0,
                child: CachedNetworkImage(
                  imageUrl: controller.agent.background!,
                  height: AppSize.screenHeight! * .55,
                  width: AppSize.screenWidth,
                  color: AppColor.primary,
                  fit: BoxFit.fill,
                ),
              ),
              Hero(
                tag: controller.tag,
                child: CachedNetworkImage(
                  imageUrl: controller.agent.fullPortrait!,
                  height: AppSize.screenHeight! * .5,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                top: AppSize.screenHeight! * .51,
                bottom: 0,
                right: 15,
                left: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.agent.displayName!,
                      style: Get.textTheme.displaySmall!
                          .copyWith(fontFamily: "Valorant"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          controller.agent.role!.displayName!,
                          style: Get.textTheme.headlineSmall!
                              .copyWith(fontFamily: "Bebas Neue"),
                        ),
                        Image.network(
                          controller.agent.role!.displayIcon!,
                          height: 30,
                        )
                      ],
                    ),
                    const VerticalSpacer(3),
                    Container(
                      height: 90,
                      color: Colors.transparent,
                      child: ListView.separated(
                        itemCount: controller.agent.abilities!.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            const HorizintalSpacer(2),
                        itemBuilder: (context, index) {
                          AbilityModel ability =
                              controller.agent.abilities![index];
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.light),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(7)),
                            ),
                            padding: const EdgeInsets.all(15),
                            child: CachedNetworkImage(
                              imageUrl: ability.displayIcon!,
                              width: 70,
                              height: 70,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
