import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/screens/registerScreen/chooseRole.dart';
import 'package:flutter_tutofast/screens/registerScreen/registerFormBloc.dart';
import 'package:flutter_tutofast/widgets/buttons/mainButton.dart';
import 'package:flutter_tutofast/widgets/forms/textInput.dart';
import 'package:get/get.dart';
class RegisterForm extends StatefulWidget {
  @override
  _RegisterForm createState() => _RegisterForm();
}
class _RegisterForm extends State<RegisterForm> {
  bool _showForm = true;
  String formTitle = 'Student Registration';
  TextStyle titleStyle = TextStyle(
    fontSize: 20.0,
    letterSpacing: -0.5,
    color: AppColors.blue,
    fontWeight: FontWeight.bold
  );
  TextStyle subtitleStyle = TextStyle(
    fontSize: 16.0,
    letterSpacing: -0.5,
    height: 1
  );

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    //final buttonHeight = (((screenHeight / 2.25) - 50.0) / 1.168) / 6.6,
    final buttonHeight = 35.0;

    return BlocProvider(
      create: (context) => RegisterFormBloc(),
      child: Builder(builder: (context) {
        final registerFormBloc = context.bloc<RegisterFormBloc>();

        final firstForm = Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: AutoSizeText(
                'Choose a Category',
                maxLines: 1,
                style: titleStyle
              )
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: AutoSizeText(
                'Enter the data in the established fields and select a category.',
                textAlign: TextAlign.center,
                style: subtitleStyle
              )
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      RegisterChooseRole(
                        onPressed: (index){
                          if(index == 0){
                            registerFormBloc.role.updateValue('ROLE_STUDENT');
                          }else {
                            registerFormBloc.role.updateValue('ROLE_TEACHER');
                          }
                          setState(() {
                            formTitle = index == 0 ? 'User Registration' : 'Teacher Registration';
                          });
                        },
                      ),
                      TextInput(
                        placeholder: 'Enter an Username',
                        keyboardType: TextInputType.name,
                        textFieldBloc: registerFormBloc.username
                      ),
                      TextInput(
                        placeholder: 'Enter your Email',
                        keyboardType: TextInputType.emailAddress,
                        textFieldBloc: registerFormBloc.email
                      ),
                      TextInput(
                        placeholder: 'Enter a Password',
                        obscureText: true,
                        textFieldBloc: registerFormBloc.password
                      ),
                      SizedBox(height: 10),
                      MainButton(
                        height: buttonHeight,
                        child: AutoSizeText('Next'),
                        color: AppColors.blue,
                        onPressed: () {
                          setState(() {
                            _showForm = !_showForm;
                          });
                        }
                      )
                    ])
                  )
                ),
            ])
          )
        ]);
        final secondForm = Column(children: [
          Container(
            alignment: Alignment.center,
            child: AutoSizeText(
              formTitle,
              maxLines: 1,
              style: titleStyle
            )
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: AutoSizeText(
              'Enter your personal data in the established fields, for your registration.',
              textAlign: TextAlign.center,
              style: subtitleStyle
            )
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: SingleChildScrollView(
                  child: Column(children: [
                    TextInput(
                      placeholder: 'Enter your Name',
                      keyboardType: TextInputType.name,
                      textFieldBloc: registerFormBloc.name
                    ),
                    TextInput(
                      placeholder: 'Enter your Last Name',
                      keyboardType: TextInputType.name,
                      textFieldBloc: registerFormBloc.lastName
                    ),
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
                    TextInput(
                      placeholder: 'Birth date (dd/mm/aa)',
                      keyboardType: TextInputType.datetime,
                      textFieldBloc: registerFormBloc.birthDate
                    ),
                    TextInput(
                      placeholder: 'Enter your Address',
                      keyboardType: TextInputType.streetAddress,
                      textFieldBloc: registerFormBloc.address
                    ),
                    SizedBox(height: 10),
                    MainButton(
                      height: buttonHeight,
                      child: AutoSizeText('Register'),
                      color: AppColors.blue,
                      onPressed: () {
                        context.bloc<RegisterFormBloc>().submit();
                      }
                    )
                  ])
                )
              )
            ])
          )
        ]);

        return FormBlocListener<RegisterFormBloc, String, String>(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: _showForm ? firstForm : secondForm
          )
        );
      })
    );
  }
}