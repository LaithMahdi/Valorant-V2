import '../../../utils/api/api.dart';
import '../../../utils/class/crud.dart';

class MapData {
  Crud crud;
  MapData(this.crud);

  getAllMaps() async {
    var resposne = await crud.getData(Api.maps);
    return resposne.fold((l) => l, (r) => r);
  }
}
