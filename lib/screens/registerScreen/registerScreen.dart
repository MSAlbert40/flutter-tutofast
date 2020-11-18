import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_sizes.dart';
import 'package:flutter_tutofast/screens/registerScreen/registerForm.dart';
import 'package:flutter_tutofast/screens/registerScreen/topBanner.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          RegisterTopBanner(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: AppSizes.horizontalSpacing
              ),
              child: RegisterForm()
            )
          ),
        ])
      )
    );
  }
}