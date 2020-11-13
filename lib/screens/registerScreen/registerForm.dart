import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/screens/registerScreen/registerFormBloc.dart';
import 'package:flutter_tutofast/screens/registerScreen/registerScreen.dart';
import 'package:flutter_tutofast/widgets/buttons/mainButton.dart';
import 'package:flutter_tutofast/widgets/forms/textInput.dart';

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return BlocProvider(
      create: (context) => RegisterFormBloc(),
      child: Builder(builder: (context) {
        // ignore: close_sinks
        final registerFormBloc = context.bloc<RegisterFormBloc>();

        return FormBlocListener<RegisterFormBloc, String, String>(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(children: [
              Container(
                height: ((screenHeight / 1.304) - 50.0) / 1.125,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Container(
                    height: (((screenHeight / 1.304) - 50.0) / 1.125) / 1.09,
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    // color: AppColors.red,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Container(
                          height: ((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 2.5,
                          // color: AppColors.blue,
                        ),
                        SizedBox(height: 10),
                        TextInput(
                          placeholder: 'Enter an Username',
                          keyboardType: TextInputType.name,
                          textFieldBloc: registerFormBloc.username
                        ),
                        SizedBox(height: 10),
                        TextInput(
                          placeholder: 'Enter your Email',
                          keyboardType: TextInputType.emailAddress,
                          textFieldBloc: registerFormBloc.email
                        ),
                        SizedBox(height: 10),
                        TextInput(
                          placeholder: 'Enter a Password',
                          obscureText: true,
                          textFieldBloc: registerFormBloc.password
                        )
                      ])
                    )
                  ),
                  Container(
                    height: (((screenHeight / 1.304) - 50.0) / 1.125) / 12.5,
                    // color: AppColors.blue,
                    child: MainButton(
                      child: AutoSizeText('Next'),
                      color: AppColors.blue,
                      onPressed: () {
                        context.bloc<RegisterFormBloc>().submit();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterDataScreen()
                        ));
                      }
                    )
                  )
                ])
              )
            ])
          )
        );
      })
    );
  }
}

class RegisterDataForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return BlocProvider(
      create: (context) => RegisterFormBloc(),
      child: Builder(builder: (context) {
        // ignore: close_sinks
        final registerFormBloc = context.bloc<RegisterFormBloc>();

        return FormBlocListener<RegisterFormBloc, String, String>(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(children: [
              Container(
                height: ((screenHeight / 1.304) - 50.0) / 1.125,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Container(
                    height: (((screenHeight / 1.304) - 50.0) / 1.125) / 1.09,
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    // color: AppColors.red,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        TextInput(
                          placeholder: 'Enter your Name',
                          keyboardType: TextInputType.name,
                          textFieldBloc: registerFormBloc.name
                        ),
                        SizedBox(height: 10),
                        TextInput(
                          placeholder: 'Enter your Last Name',
                          keyboardType: TextInputType.name,
                          textFieldBloc: registerFormBloc.lastName
                        ),
                        SizedBox(height: 10),
                        Row(children: <Widget>[
                          Expanded(
                            child: TextInput(
                              placeholder: 'Enter your DNI',
                              keyboardType: TextInputType.number,
                              textFieldBloc: registerFormBloc.dni,
                            )
                          ),
                          Container(width: 30.0),
                          Expanded(
                            child: TextInput(
                              placeholder: 'Enter your Phone',
                              keyboardType: TextInputType.number,
                              textFieldBloc: registerFormBloc.phone,
                            )
                          )
                        ]),
                        SizedBox(height: 10),
                        TextInput(
                          placeholder: 'Birth date (dd/mm/aa)',
                          keyboardType: TextInputType.datetime,
                          textFieldBloc: registerFormBloc.birthDate
                        ),
                        SizedBox(height: 10),
                        TextInput(
                          placeholder: 'Enter your Address',
                          keyboardType: TextInputType.streetAddress,
                          textFieldBloc: registerFormBloc.address
                        )
                      ])
                    )
                  ),
                  Container(
                    height: (((screenHeight / 1.304) - 50.0) / 1.125) / 12.5,
                    // color: AppColors.blue,
                    child: MainButton(
                      child: AutoSizeText('Register'),
                      color: AppColors.blue,
                      onPressed: () {
                        context.bloc<RegisterFormBloc>().submit();
                      }
                    )
                  )
                ])
              )
            ])
          )
        );
      })
    );
  }
}