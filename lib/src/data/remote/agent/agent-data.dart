import '../../../utils/api/api.dart';
import '../../../utils/class/crud.dart';

class AgentData {
  Crud crud;
  AgentData(this.crud);

  getAllAgents() async {
    var resposne = await crud.getData(Api.agents);
    return resposne.fold((l) => l, (r) => r);
  }
}
