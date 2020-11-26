import 'package:dio/dio.dart';
import 'package:flutter_tutofast/dto/profileResultDTO.dart';
import 'package:flutter_tutofast/dto/reviewResultDTO.dart';
import 'package:flutter_tutofast/screens/profileScreen/profileData.dart';
import 'package:hive/hive.dart';

class ReviewData {
  ProfileData profileData;
  ProfileResultDTO profile;

  Future<ReviewResultDTO> getDataReview() async {
    profileData = ProfileData();
    profile = ProfileResultDTO();

    try {
      ProfileResultDTO result = await profileData.getDataProfile();

      Dio dio = new Dio();
      final _sessionbox = Hive.box('session');

      String token = _sessionbox.get('token');
      String username = result.id.toString();
      String url = 'https://tutofast-api.herokuapp.com/api/reviews/teacher/' + username;
      String auth = 'Bearer ' + token;
      print('this is a teacherId');
      print(username);

      final _reviewDataResult = await dio.get(url,
        options: Options(headers: {
          'Authorization': auth,
        }),
      );

      ReviewResultDTO _response = ReviewResultDTO.fromjson(_reviewDataResult.data);

      return _response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
