import '../../../utils/api/api.dart';
import '../../../utils/class/crud.dart';

class WeaponData {
  Crud crud;
  WeaponData(this.crud);

  getAllWeapons() async {
    var resposne = await crud.getData(Api.weapons);
    return resposne.fold((l) => l, (r) => r);
  }
}
