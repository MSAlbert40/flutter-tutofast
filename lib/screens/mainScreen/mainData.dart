import 'package:dio/dio.dart';
import 'package:flutter_tutofast/dto/mainResultDTO.dart';

class MainData {
  Future<List> getDataMain(int courserId) async {
    int courseId;

    try {
      Dio dio = new Dio();

      String id = courseId.toString();
      String url = 'https://tutofast-api.herokuapp.com/api/sessions/filtered';
      
      final _mainDataResult = await dio.get(url);

      List mains = _mainDataResult.data
          .map((value) => MainResultDTO.fromJson(value))
          .toList();

      print(id);
      print(_mainDataResult);

      return mains;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
