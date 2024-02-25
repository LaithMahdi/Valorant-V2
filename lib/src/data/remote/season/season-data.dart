import '../../../utils/api/api.dart';
import '../../../utils/class/crud.dart';

class SeasonData {
  Crud crud;
  SeasonData(this.crud);

  getAllSeasons() async {
    var resposne = await crud.getData(Api.seasons);
    return resposne.fold((l) => l, (r) => r);
  }
}
