import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/dto/loginRestultDTO.dart';
import 'package:flutter_tutofast/utils/formValidations.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LoginFormBloc extends FormBloc<String, String> {
  // ignore: close_sinks
  final username = TextFieldBloc(
      name: 'username',
      initialValue: '',
      validators: [isRequired('You need to enter your username or email')]);
  // ignore: close_sinks
  final password = TextFieldBloc(
      name: 'password',
      initialValue: '',
      validators: [isRequired('You need to enter your password')]);

  LoginFormBloc() {
    addFieldBlocs(fieldBlocs: [username, password]);
  }

  @override
  void onSubmitting() async {
    try {
      Dio dio = new Dio();
      var request = {
        'username': username.value,
        'password': password.value
      };

      final _loginResult = await dio.post(
        'https://tutofast-api.herokuapp.com/api/auth/signin',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json'
        }),
        data: jsonEncode(request)
      );

      final _response =  LoginResultDTO.fromJson(_loginResult.data);
      Directory directory = await getApplicationDocumentsDirectory();
      await Hive.init(directory.path);
      var _box = await Hive.openBox('session');
      _box.put('username', _response.username);

      final _mainColor = _response.username == 'jesus.student' ? AppColors.green : AppColors.blue;
      ThemeData _theme = ThemeData(primaryColor: _mainColor);
      Get.changeTheme(_theme);
      
    } catch(e) {
      print(e);
    }
  }
}
