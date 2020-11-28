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

      final _reviewsMap = _reviewDataResult.data['content'];

      List reviews = _reviewsMap.map(
        (value) => ReviewResultDTO.fromjson(value)
      ).toList();

      return reviews;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List> getRatings(List reviews) async {

    List<double> ratings = List.filled(6, 0);
    List<double> scores = List.filled(6, 0);

    double totalReviews = 0;
    double average = 0;
    
    print('*****');

    for(var item in reviews) {
      print(item.stars);
      switch(item.stars) {
        case 1:
          scores[1]++;
        break;
        case 2:
          scores[2]++;
        break;
        case 3:
          scores[3]++;
        break;
        case 4:
          scores[4]++;
        break;
        case 5:
          scores[5]++;
        break;
      }
      totalReviews++;
    }
    
    print('*****');

    for(int i = 1; i <= 5; i++) {
      ratings[i] = scores[i] / totalReviews;
      average = scores[i] * i + average;
      print(ratings[i]);
    }
    ratings[0] = average / totalReviews;
    print('*****');
    print(ratings[0]);

    return ratings;
  }
}
