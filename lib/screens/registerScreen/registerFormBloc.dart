import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_tutofast/constants/app_routes.dart';
import 'package:flutter_tutofast/utils/formValidations.dart';
import 'package:flutter_tutofast/widgets/appLoadingDialog.dart';
import 'package:get/get.dart';

class RegisterFormBloc extends FormBloc<String, String> {
  final role = TextFieldBloc(
    name: 'role',
    initialValue: 'ROLE_STUDENT',
    validators: [isRequired('You need to enter an role')]);
  final username = TextFieldBloc(
      name: 'username',
      initialValue: '',
      validators: [isRequired('You need to enter an username')]);
  final email = TextFieldBloc(
      name: 'email',
      initialValue: '',
      validators: [isRequired('You need to enter your email')]);
  // ignore: close_sinks
  final password = TextFieldBloc(
      name: 'password',
      initialValue: '',
      validators: [isRequired('You need to enter a password')]);
  // ignore: close_sinks
  final name = TextFieldBloc(
      name: 'name',
      initialValue: '',
      validators: [isRequired('You need to enter your name')]);
  // ignore: close_sinks
  final lastName = TextFieldBloc(
      name: 'lastName',
      initialValue: '',
      validators: [isRequired('You need to enter yours last names')]);
  // ignore: close_sinks
  final dni = TextFieldBloc(
      name: 'DNI',
      initialValue: '',
      validators: [isRequired('You need to enter your DNI')]);
  // ignore: close_sinks
  final phone = TextFieldBloc(
      name: 'phone',
      initialValue: '',
      validators: [isRequired('You need to enter your phone')]);
  // ignore: close_sinks
  final birthDate = TextFieldBloc(
      name: 'birthDate',
      initialValue: '',
      validators: [isRequired('You need to enter your birth date')]);
  // ignore: close_sinks
  final address = TextFieldBloc(
      name: 'address',
      initialValue: '',
      validators: [isRequired('You need to enter your address')]);

  RegisterFormBloc() {
    addFieldBlocs(fieldBlocs: [
      role,
      username,
      email,
      password,
      name,
      lastName,
      dni,
      phone,
      birthDate,
      address
    ]);
  }

  @override
  void onSubmitting() async {
    try {
      AppLoadingDialog.show();
      Dio dio = new Dio();
      var request = {
        'username': username.value,
        'password': password.value,
        'email': email.value,
        'name': name.value,
        'lastName': lastName.value,
        'dni': dni.value,
        'phone': phone.value,
        'birthday': birthDate.value,
        'address': address.value,
        'role': [role.value]
      };
      print('request');
      print(request);

      final _signupResult = await dio.post(
        'https://tutofast-api.herokuapp.com/api/auth/signup',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
        data: jsonEncode(request)
      );
      print('_signupResult');
      print(_signupResult);
      AppLoadingDialog.hide();
      print('hide');
      Get.toNamed(AppRoutes.login);
    } catch(e) {
      print(e);
      AppLoadingDialog.hide();
    }
  }
}
