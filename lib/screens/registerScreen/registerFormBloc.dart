import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_tutofast/constants/app_routes.dart';
import 'package:flutter_tutofast/utils/formValidations.dart';
import 'package:flutter_tutofast/widgets/appAlertDialog.dart';
import 'package:flutter_tutofast/widgets/appLoadingDialog.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class RegisterFormBloc extends FormBloc<String, String> {
  // ignore: close_sinks
  final role = TextFieldBloc(
    name: 'role',
    initialValue: 'ROLE_STUDENT',
    validators: [isRequired('You need to select an role')]);
  // ignore: close_sinks
  final username = TextFieldBloc(
      name: 'username',
      initialValue: '',
      validators: [isRequired('You need to enter an username')]);
  // ignore: close_sinks
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

      final _signupResult = await dio.post(
        'https://tutofast-api.herokuapp.com/api/auth/signup',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
        data: jsonEncode(request)
      );

      AppLoadingDialog.hide();
      /*AppAlertDialog.show(
        contentText: 'Registro exitoso',
      );*/

      if(role.value == 'ROLE_STUDENT') {
         Directory directory = await getApplicationDocumentsDirectory();
        // ignore: await_only_futures
        await Hive.init(directory.path);
        var _tempBox = await Hive.openBox('user');
        _tempBox.put('username', username.value);

        Get.toNamed(AppRoutes.subscription);
      }
      else Get.toNamed(AppRoutes.login);

    } catch(e) {
      AppLoadingDialog.hide();
      AppAlertDialog.show(
        contentText: 'Ocurrió un error al registrar su datos. Verifique e intente nuevamente por favor',
      );
    }
  }
}
