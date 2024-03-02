import '../../../utils/api/api.dart';
import '../../../utils/class/crud.dart';

class BundleData {
  Crud crud;
  BundleData(this.crud);

  getAllBundles() async {
    var resposne = await crud.getData(Api.bundles);
    return resposne.fold((l) => l, (r) => r);
  }
}
