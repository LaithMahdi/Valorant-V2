import 'package:fortnite/src/data/model/agent/agent-model.dart';
import 'package:get/get.dart';

class AgentDetailController extends GetxController {
  late String _tag;
  late AgentModel _agent;
  int _selectedAbility = 0;

  // Getter
  String get tag => _tag;
  AgentModel get agent => _agent;
  int get selectedAbility => _selectedAbility;

  @override
  void onInit() {
    _agent = Get.arguments["agent"];
    _tag = Get.arguments["tag"];
    super.onInit();
  }

  void setSelectedAbility(int index) {
    _selectedAbility = index;
    print("Selected Ability: $_selectedAbility");
    update();
  }
}
