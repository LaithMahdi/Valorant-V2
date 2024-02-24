import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/local/agent/role-items.dart';
import '../../../data/model/agent/agent-model.dart';
import '../../../shared/widgets/buttons/btn-back.dart';
import '../../../shared/widgets/loading/loading-state.dart';
import '../../../shared/widgets/spacer/spacer.dart';
import '../../controller/agent/agent-controller.dart';
import '../../widgets/agent/card-agent.dart';

class AgentScreen extends StatelessWidget {
  const AgentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AgentController controller = Get.put(AgentController());
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.name!, style: Get.textTheme.headlineMedium),
        leading: const BtnBack(),
        bottom: TabBar(
          controller: controller.tabController,
          padding: EdgeInsets.zero,
          isScrollable: true,
          automaticIndicatorColorAdjustment: true,
          tabs: List.generate(
            roleItems.length,
            (index) => Tab(text: roleItems[index].name.toUpperCase()),
          ),
        ),
      ),
      body: GetBuilder<AgentController>(
        builder: (controller) => LoadingState(
          status: controller.statusRequest,
          widget: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              itemCount: controller.agents.length,
              separatorBuilder: (context, index) => const VerticalSpacer(4),
              itemBuilder: (context, index) {
                AgentModel agent = controller.agents[index];
                List<Color> gradientColors = agent.backgroundGradientColors!
                    .map<Color>(
                        (colorString) => Color(int.parse('0xFF$colorString')))
                    .toList();

                return CardAgent(
                  agent: agent,
                  colors: gradientColors,
                  onTap: () =>
                      controller.goToDetail(agent, agent.fullPortrait!),
                );
              }),
        ),
      ),
    );
  }
}
