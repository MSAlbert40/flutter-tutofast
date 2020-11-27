import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_tutofast/dto/profileResultDTO.dart';
import 'package:flutter_tutofast/dto/reviewResultDTO.dart';
import 'package:flutter_tutofast/screens/profileScreen/profileData.dart';
import 'package:hive/hive.dart';

class ReviewData {
  ProfileData profileData;
  ProfileResultDTO profile;

  Future<List> getDataReview() async {
    profileData = ProfileData();
    profile = ProfileResultDTO();

    try {
      ProfileResultDTO result = await profileData.getDataProfile();

      Dio dio = new Dio();
      final _sessionbox = Hive.box('session');

      String token = _sessionbox.get('token');
      String teacherId = result.id.toString();
      String url = 'https://tutofast-api.herokuapp.com/api/reviews/teacher/' + teacherId;
      String auth = 'Bearer ' + token;
      print('this is a teacherId');
      print(teacherId);

      final _reviewDataResult = await dio.get(url,
        options: Options(headers: {
          'Authorization': auth,
        }),
      );
      //final jsonResponse = json.decode(_reviewDataResult.data);
      final _reviewsMap = _reviewDataResult.data['content'];

      print(_reviewsMap);

      List reviews = _reviewsMap.map(
        (value) => ReviewResultDTO.fromJson(value)
      ).toList();
      
      return reviews;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
