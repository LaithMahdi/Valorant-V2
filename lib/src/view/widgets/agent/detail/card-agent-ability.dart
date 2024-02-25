import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/model/agent/agent-model.dart';
import '../../../../utils/constants/app-color.dart';
import '../../../controller/agent/detail/agent-detail-controller.dart';

class CardAgentAbility extends GetView<AgentDetailController> {
  final AbilityModel ability;
  final int index;
  const CardAgentAbility(this.ability, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.slowMiddle,
      decoration: BoxDecoration(
        border: Border.all(
            color: controller.selectedAbility == index
                ? AppColor.primary
                : AppColor.light),
        borderRadius: const BorderRadius.all(Radius.circular(7)),
      ),
      padding: const EdgeInsets.all(15),
      child: CachedNetworkImage(
        imageUrl: ability.displayIcon!,
        width: 70,
        height: 70,
        color: controller.selectedAbility == index
            ? AppColor.primary
            : AppColor.light,
      ),
    );
  }
}
