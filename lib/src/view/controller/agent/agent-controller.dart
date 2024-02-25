import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/local/agent/role-items.dart';
import '../../../data/model/agent/agent-model.dart';
import '../../../data/remote/agent/agent-data.dart';
import '../../../utils/class/status-request.dart';
import '../../../utils/constants/app-route.dart';
import '../../../utils/functions/handling-data.dart';

class AgentController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController _tabController;
  late String _name = "";
  final int _initialIndex = 1;
  StatusRequest _statusRequest = StatusRequest.loading;
  final AgentData _agentData = AgentData(Get.find());
  List<AgentModel> _initialAgents = [];
  List<AgentModel> _filteredAgents = [];

  // Getter
  StatusRequest get statusRequest => _statusRequest;
  List<AgentModel> get agents => _filteredAgents;
  TabController get tabController => _tabController;
  String? get name => _name;

  @override
  void onInit() {
    _tabController = TabController(
        length: roleItems.length, vsync: this, initialIndex: _initialIndex);
    _tabController.addListener(_onTabChanged);
    _name = Get.arguments["name"];
    getAgents();
    super.onInit();
  }

  void _onTabChanged() {
    int selectedIndex = _tabController.index;
    if (selectedIndex < 0 || selectedIndex >= roleItems.length) {
      return;
    }
    String selectedRole = roleItems[selectedIndex].name.toLowerCase();
    _filteredAgents = _filterAgentsByRole(selectedRole);
    update();
  }

  List<AgentModel> _filterAgentsByRole(String roleName) {
    if (roleName == "all") {
      return _initialAgents;
    } else {
      return _initialAgents
          .where((agent) => agent.role?.displayName?.toLowerCase() == roleName)
          .toList();
    }
  }

  Future<void> getAgents() async {
    _statusRequest = StatusRequest.loading;
    update();
    var response = await _agentData.getAllAgents();
    _statusRequest = handlingData(response);
    if (_statusRequest == StatusRequest.loaded) {
      if (response != null && response["status"] == 200) {
        _initialAgents = List.generate(
          response["data"].length,
          (index) => AgentModel.fromJson(response["data"][index]),
        );
        _filteredAgents = List.of(_initialAgents);
        _onTabChanged();
      } else {
        _statusRequest = StatusRequest.failure;
      }
    } else {
      _statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onClose() {
    _tabController.removeListener(_onTabChanged);
    super.onClose();
  }

  goToDetail(AgentModel agent, String tag) {
    Get.toNamed(AppRoute.agentDetail, arguments: {"agent": agent, "tag": tag});
  }
}
