import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/screens/loginScreen/loginFormBloc.dart';
import 'package:flutter_tutofast/widgets/buttons/mainButton.dart';
import 'package:flutter_tutofast/widgets/forms/textInput.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => LoginFormBloc(),
      child: Builder(builder: (context) { 
        final loginFormBloc = context.bloc<LoginFormBloc>();

        return FormBlocListener<LoginFormBloc, String, String>(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: (((screenHeight / 2.25) - 50.0) / 1.168) / 1.18,
                  // color: AppColors.red,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(height: 10),
                      TextInput(
                        placeholder: 'Email / Username',
                        keyboardType: TextInputType.emailAddress,
                        textFieldBloc: loginFormBloc.username
                      ),
                      SizedBox(height: 10),
                      TextInput(
                        placeholder: 'Password',
                        obscureText: true,
                        textFieldBloc: loginFormBloc.password
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 20,
                        alignment: Alignment.centerRight,
                        child: AutoSizeText(
                          'Forget Password?',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.lead.withOpacity(0.7)
                          )
                        )
                      )
                    ])
                  )
                ),
                Container(
                  height: (((screenHeight / 2.25) - 50.0) / 1.168) / 6.6,
                  //color: AppColors.red,
                  child: MainButton(
                    child: AutoSizeText('Sign In'),
                    color: AppColors.blue,
                    onPressed: () {
                      // hideKeyboard(context);
                      context.bloc<LoginFormBloc>().submit();
                    }
                  )
                )
              ]
            )
          )
        );
      })
    );
  }
}
