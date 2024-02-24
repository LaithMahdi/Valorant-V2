import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'status-request.dart';

class Crud {
  Dio dio = Dio();

  Future<Either<StatusRequest, dynamic>> getData(String linkurl) async {
    try {
      Response response = await dio.get(linkurl);
      print("crudd ----- ${response.statusCode}");

      if (response.statusCode == 200) {
        dynamic responsebody = response.data;
        print("responsebody $responsebody");
        return Right(responsebody);
      } else if (response.statusCode == 400 || response.statusCode == 404) {
        dynamic responsebody = response.data;
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.failure);
      }
    } catch (_) {
      return const Left(StatusRequest.failure);
    }
  }
}
