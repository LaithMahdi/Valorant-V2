import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fortnite/src/data/model/agent/agent-model.dart';
import 'package:get/get.dart';
import '../../../utils/constants/app-color.dart';
import '../../../utils/constants/app-size.dart';
import '../shape/rounded-diagonal-border-painter.dart';

class CardAgent extends StatelessWidget {
  final AgentModel agent;
  final List<Color> colors;
  final VoidCallback? onTap;
  const CardAgent(
      {super.key, required this.agent, required this.colors, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: agent.fullPortrait!,
        child: ClipPath(
            clipBehavior: Clip.none,
            child: CustomPaint(
              painter: RoundedDiagonalBorderPainter(
                gradient: LinearGradient(
                  colors: colors,
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Container(
                width: AppSize.screenWidth,
                height: AppSize.screenHeight! * 0.2,
                clipBehavior: Clip.none,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: -35,
                      top: -35,
                      bottom: 0,
                      child: agent.fullPortrait != null
                          ? CachedNetworkImage(imageUrl: agent.fullPortrait!)
                          : Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(left: 70, top: 30),
                              child: const CircularProgressIndicator(),
                            ),
                    ),
                    Positioned(
                      left: AppSize.screenWidth! / 3,
                      top: AppSize.screenHeight! * 0.07,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            agent.displayName!.toUpperCase(),
                            style: Get.textTheme.displaySmall,
                          ),
                          Text(agent.role!.displayName!.toUpperCase(),
                              style: Get.textTheme.bodyMedium!
                                  .copyWith(fontFamily: "Bebas Neue")),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 15,
                      bottom: 15,
                      child: Image.network(agent.role!.displayIcon!,
                          width: 20, color: AppColor.light),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
