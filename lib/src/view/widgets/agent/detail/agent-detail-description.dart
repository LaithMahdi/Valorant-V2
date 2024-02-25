import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/model/agent/agent-model.dart';
import '../../../../shared/widgets/spacer/spacer.dart';
import '../../../controller/agent/detail/agent-detail-controller.dart';
import 'card-agent-ability.dart';

class AgentDetailDescription extends GetView<AgentDetailController> {
  const AgentDetailDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          controller.agent.displayName!,
          style: Get.textTheme.displaySmall!.copyWith(fontFamily: "Valorant"),
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
              height: 25,
            )
          ],
        ),
        const VerticalSpacer(3),
        Text(
          controller.agent.description!,
          style: Get.textTheme.bodyMedium!.copyWith(fontFamily: "Bebas Neue"),
        ),
        const VerticalSpacer(3),
        Container(
          height: 90,
          color: Colors.transparent,
          child: ListView.separated(
            itemCount: controller.agent.abilities!.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const HorizintalSpacer(2),
            itemBuilder: (context, index) {
              AbilityModel ability = controller.agent.abilities![index];
              return InkWell(
                onTap: () => controller.setSelectedAbility(index),
                child: GetBuilder<AgentDetailController>(
                  builder: (controller) => CardAgentAbility(ability, index),
                ),
              );
            },
          ),
        ),
        const VerticalSpacer(3),
        GetBuilder<AgentDetailController>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  controller.agent.abilities![controller.selectedAbility]
                      .displayName!,
                  style: Get.textTheme.headlineSmall),
              const VerticalSpacer(1),
              Text(
                  controller.agent.abilities![controller.selectedAbility]
                      .description!,
                  style: Get.textTheme.bodyMedium!
                      .copyWith(fontFamily: "Bebas Neue")),
            ],
          ),
        )
      ],
    );
  }
}
