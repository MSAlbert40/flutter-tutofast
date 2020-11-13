import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_tutofast/utils/formValidations.dart';

class RegisterFormBloc extends FormBloc<String, String> {
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
    addFieldBlocs(fieldBlocs: [username, email, password, name, lastName, dni, phone, birthDate, address]);
  }

  @override
  void onSubmitting() {
    // TODO: implement onSubmitting
  }
}
