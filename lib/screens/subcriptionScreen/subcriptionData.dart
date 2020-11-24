import 'package:dio/dio.dart';
import 'package:flutter_tutofast/dto/subcriptionResultDTO.dart';

class SubcriptionData {

  Future<List> getDataSubcription() async {
    try {
      Dio dio = new Dio();

      String url = 'https://tutofast-api.herokuapp.com/api/plans/available';

      final _subcriptionDataResult = await dio.get(url);

      List subcriptions = _subcriptionDataResult.data.map(
        (value) => SubcriptionResultDTO.fromJson(value)
      ).toList();

      return subcriptions;

    } catch(e) {
      print(e);
      return null;
    }
  }
}