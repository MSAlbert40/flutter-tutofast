import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/screens/loginScreen/loginScreen.dart';
import 'package:flutter_tutofast/screens/registerScreen/selectRole.dart';
import 'package:flutter_tutofast/screens/registerScreen/registerFormBloc.dart';
import 'package:flutter_tutofast/screens/subcriptionScreen/subcriptionScreen.dart';
import 'package:flutter_tutofast/widgets/buttons/mainButton.dart';
import 'package:flutter_tutofast/widgets/buttons/microButton.dart';
import 'package:flutter_tutofast/widgets/forms/textInput.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterForm createState() => _RegisterForm();
}
class _RegisterForm extends State<RegisterForm> {
  bool _showForm = true;
  dynamic mainRoute = SubcriptionScreen();
  String mainTitle = 'Student Registration';
  AssetImage mainBackground = AssetImage('assets/images/backgrounds/BPS.jpg');

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => RegisterFormBloc(),
      child: Builder(builder: (context) {
        final registerFormBloc = context.bloc<RegisterFormBloc>();

        final firstForm = 
        Column(children: [
          Stack(children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/backgrounds/BT.jpg')
                )
              )
            ),
            Container(
              width: screenWidth,
              height: screenHeight,
              color: AppColors.blue.withOpacity(0.55),
            ),
            Container(
              width: screenWidth,
              height: screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: screenHeight / 4.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: (screenHeight / 4.3) / 1.6,
                          // color: AppColors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                            Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/icons/OL.png')
                                )
                              )
                            )
                          ])
                        ),
                        Container(
                        height: (screenHeight / 4.3) / 2.7,
                        // color: AppColors.cyan,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MicroButton(
                                width: screenWidth / 2.3,
                                height: ((screenHeight / 4.3) / 2.7) / 2,
                                alignment: Alignment.center,
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginScreen()
                                  ));
                                },
                                child: AutoSizeText(
                                  'Sign In',
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold
                                  )
                                )
                              ),
                              MicroButton(
                                width: screenWidth / 2.3,
                                height: ((screenHeight / 4.3) / 2.7) / 2,
                                alignment: Alignment.center,
                                color: AppColors.blue,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)
                                ),
                                child: AutoSizeText(
                                  'Register',
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold
                                  )
                                )
                              )
                            ]
                          )
                        ])
                      )
                    ])
                  ),
                  Container(
                    height: screenHeight / 1.304,
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: (screenHeight / 1.304) - 50.0,
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: ((screenHeight / 1.304) - 50.0) / 9,
                                // color: AppColors.green,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: (((screenHeight / 1.304) - 50.0) / 9) / 2,
                                      alignment: Alignment.center,
                                      child: AutoSizeText(
                                        'Choose a Category',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          letterSpacing: -0.5,
                                          color: AppColors.blue,
                                          fontWeight: FontWeight.bold
                                        )
                                      )
                                    ),
                                    Container(
                                      height: (((screenHeight / 1.304) - 50.0) / 9) / 2,
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                                      child: AutoSizeText(
                                        'Enter the data in the established fields and select a category.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          letterSpacing: -0.5,
                                          height: 1
                                        )
                                      )
                                    )
                                ])
                              ),
                              Container(
                                height: ((screenHeight / 1.304) - 50.0) / 1.125,
                                // color: AppColors.blue
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
                                            height: ((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 2.6,
                                            // color: AppColors.green,
                                            child: Column(children: [
                                              RegisterSelectRole(
                                                onPressed: (index){
                                                  if(index == 0){
                                                    registerFormBloc.role.updateValue('ROLE_STUDENT');
                                                  } else {
                                                    registerFormBloc.role.updateValue('ROLE_TEACHER');
                                                  }
                                                  setState(() {
                                                    mainRoute = index == 0 ? SubcriptionScreen() : LoginScreen();
                                                    mainTitle = index == 0 ? 'User Registration' : 'Teacher Registration';
                                                    mainBackground = index == 0 ? AssetImage('assets/images/backgrounds/BPS.jpg') : AssetImage('assets/images/backgrounds/BPT.jpg');
                                                  });
                                                }
                                              )
                                            ])
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
                                          setState(() {
                                            _showForm = !_showForm;
                                          });
                                        }
                                      )
                                    )
                                ])
                              )
                          ])
                        )
                    ])
                  )
              ])
            )
          ])
        ]);
        final secondForm = 
        Column(children: [
          Stack(children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: mainBackground
                )
              )
            ),
            Container(
              width: screenWidth,
              height: screenHeight,
              color: AppColors.blue.withOpacity(0.55),
            ),
            Container(
              width: screenWidth,
              height: screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: screenHeight / 4.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: (screenHeight / 4.3) / 1.6,
                          // color: AppColors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                            Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/icons/OL.png')
                                )
                              )
                            )
                          ])
                        ),
                        Container(
                        height: (screenHeight / 4.3) / 2.7,
                        // color: AppColors.cyan,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MicroButton(
                                width: screenWidth / 2.3,
                                height: ((screenHeight / 4.3) / 2.7) / 2,
                                alignment: Alignment.center,
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginScreen()
                                  ));
                                },
                                child: AutoSizeText(
                                  'Sign In',
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold
                                  )
                                )
                              ),
                              MicroButton(
                                width: screenWidth / 2.3,
                                height: ((screenHeight / 4.3) / 2.7) / 2,
                                alignment: Alignment.center,
                                color: AppColors.blue,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)
                                ),
                                child: AutoSizeText(
                                  'Register',
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold
                                  )
                                )
                              )
                            ]
                          )
                        ])
                      )
                    ])
                  ),
                  Container(
                    height: screenHeight / 1.304,
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: (screenHeight / 1.304) - 50.0,
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: ((screenHeight / 1.304) - 50.0) / 9,
                                // color: AppColors.green,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: (((screenHeight / 1.304) - 50.0) / 9) / 2,
                                      alignment: Alignment.center,
                                      child: AutoSizeText(
                                        mainTitle,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          letterSpacing: -0.5,
                                          color: AppColors.blue,
                                          fontWeight: FontWeight.bold
                                        )
                                      )
                                    ),
                                    Container(
                                      height: (((screenHeight / 1.304) - 50.0) / 9) / 2,
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                                      child: AutoSizeText(
                                        'Enter the data in the established fields and select a category.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          letterSpacing: -0.5,
                                          height: 1
                                        )
                                      )
                                    )
                                ])
                              ),
                              Container(
                                height: ((screenHeight / 1.304) - 50.0) / 1.125,
                                // color: AppColors.blue
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
                                          ),
                                          SizedBox(height: 10),
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
                                          // context.bloc<RegisterFormBloc>().submit();
                                          Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => mainRoute
                                          ));
                                        }
                                      )
                                    )
                                ])
                              )
                          ])
                        )
                    ])
                  )
              ])
            )
          ])
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