import 'dart:io';

import 'package:flutter_tutofast/dto/profileResultDTO.dart';
import 'package:hive/hive.dart';
import 'package:dio/dio.dart';

class ProfileData{

  Future<ProfileResultDTO> getDataProfile() async {
    try {
      Dio dio = new Dio();
      final _sessionbox = Hive.box('session');

      String token = _sessionbox.get('token');
      String username = _sessionbox.get('username');
      String url = 'https://tutofast-api.herokuapp.com/api/users/username/' + username;
      String auth = 'Bearer ' + token;

      final _profileDataResult = await dio.get(url,
        options: Options(
          headers: {
            'Authorization': auth,
          }
        ),
      );

      ProfileResultDTO _response = ProfileResultDTO.fromJson(_profileDataResult.data);

      return _response;
    } catch(e){
      print(e);
      return null;
    }
  }
}