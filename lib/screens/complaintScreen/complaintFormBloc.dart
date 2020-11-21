import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_tutofast/dto/profileResultDTO.dart';
import 'package:flutter_tutofast/utils/formValidations.dart';
import 'package:hive/hive.dart';

class ComplaintFormBloc extends FormBloc<String, String>{
  // ignore: close_sinks
  final reason = TextFieldBloc(
    name: 'reason',
    initialValue: '',
    validators: [
      isRequired('You need to enter your reason')
    ]
  );
  // ignore: close_sinks
  final description = TextFieldBloc(
    name: 'description',
    initialValue: '',
    validators: [
      isRequired('You need to enter your description')
    ]
  );

  ComplaintFormBloc() {
    addFieldBlocs(fieldBlocs: [reason, description]);
  }

  @override
  void onSubmitting() async {
    try {
      Dio dio = new Dio();
      final _sessionbox = Hive.box('session');

      var request = {'reason': reason.value, 'description': description.value};

      String token = _sessionbox.get('token');
      String username1 = _sessionbox.get('username');
      String auth = 'Bearer ' + token;
      String username2 = username1 == 'jesus.student' ? 'albert.teacher' : 'jesus.student';

      //MadeById
      final _user1DataResult = await dio.get(
        'https://tutofast-api.herokuapp.com/api/users/username/' + username1,
        options: Options(
          headers: {
            'Authorization': auth,
          }
        ),
      );
      String madeById = ProfileResultDTO.fromJson(_user1DataResult.data).id.toString();

      //ReportedId
      final _user2DataResult = await dio.get(
        'https://tutofast-api.herokuapp.com/api/users/username/' + username2,
        options: Options(
          headers: {
            'Authorization': auth,
          }
        ),
      );
      String reportedId = ProfileResultDTO.fromJson(_user2DataResult.data).id.toString();

      //Complaint
      final _complaintResult = await dio.post(
        'https://tutofast-api.herokuapp.com/api/complaints/madeBy/' + madeById + '/reported/' + reportedId + '/',
        options: Options(
          headers: {
            'Authorization': auth,
          }
        ),
        data: jsonEncode(request)
      );
    } catch (e) {
      print(e);
      return null;
    }
  }

}