import 'package:flutter/material.dart';
import 'package:flutter_tutofast/screens/registerScreen/registerForm.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [RegisterForm()])
      )
    );
  }
}