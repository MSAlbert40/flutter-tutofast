import 'dart:io';

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

      print(subcriptions);
      
      return subcriptions;
    } catch(e) {
      print(e);
      return null;
    }
  }

  void postSubcription(int idSubcription) async {
    try {
      Dio dio = new Dio();
      
      String url = 'https://tutofast-api.herokuapp.com/api/subscriptions/userId/' + '61' + '/plan/' + idSubcription.toString();
      
      await dio.post(url,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }
        ),
      );

    } catch(e) {
      print(e);
      return null;
    }
  }
}