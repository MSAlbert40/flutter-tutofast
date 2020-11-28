import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_tutofast/dto/subcriptionResultDTO.dart';
import 'package:hive/hive.dart';

import '../../dto/profileResultDTO.dart';
import '../../widgets/appAlertDialog.dart';

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
      
      var _tempBox = await Hive.openBox('user');
      String username = _tempBox.get('username');

      String url1 = 'https://tutofast-api.herokuapp.com/api/users/username/' + username;
      final _profileDataResult = await dio.get(url1);
      ProfileResultDTO profile = ProfileResultDTO.fromJson(_profileDataResult.data);

      String url2 = 'https://tutofast-api.herokuapp.com/api/subscriptions/userId/' + profile.id.toString() + '/plan/' + idSubcription.toString();
      
      await dio.post(url2,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }
        ),
      );

      AppAlertDialog.show(
        contentText: 'Registro exitoso',
      );

    } catch(e) {
      print(e);
      return null;
    }
  }
}