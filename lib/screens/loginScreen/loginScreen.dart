import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_fonts.dart';
import 'package:flutter_tutofast/screens/loginScreen/loginForm.dart';
import 'package:flutter_tutofast/screens/registerScreen/registerScreen.dart';
import 'package:flutter_tutofast/widgets/buttons/microButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
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
              color: AppColors.blue.withOpacity(0.5)
            ),
            Container(
              width: screenHeight,
              height: screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Container(
                  height: screenHeight / 1.8,
                  // color: AppColors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container( 
                        width: screenWidth,
                        height: (screenHeight / 1.8) / 1.09,
                        // color: AppColors.cyan,
                        child: Column(children: [
                          Container(
                            height: ((screenHeight / 1.8) / 1.09) / 3.5,
                            // color: AppColors.red,
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
                              ]
                            )
                          ),
                          Container(
                            height: ((screenHeight / 1.8) / 1.09) / 1.5,
                            // color: AppColors.cyan,
                            margin: EdgeInsets.symmetric(horizontal: 35),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: AutoSizeText(
                                    'Welcome to',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 34,
                                      color: AppColors.white,
                                      fontFamily: AppFonts.afterNight
                                    )
                                  )
                                ),
                                Container(
                                  child: AutoSizeText(
                                    'TutoFast',
                                    maxLines: 1,
                                    style: TextStyle(
                                      height: 1,
                                      fontSize: 118,
                                      color: AppColors.white,
                                      fontFamily: AppFonts.bebasNeue
                                    )
                                  )
                                )
                              ]
                            )
                          )
                        ])
                      ),
                      Container(
                        height: (screenHeight / 1.8) / 12.8,
                        // color: AppColors.blue,
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MicroButton(
                                width: screenWidth / 2.3,
                                height: (screenHeight / 1.8) / 12.8,
                                alignment: Alignment.center,
                                color: AppColors.blue,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)
                                ),
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
                                height: (screenHeight / 1.8) / 12.8,
                                alignment: Alignment.center,
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RegisterScreen()
                                  ));
                                },
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
                    ]
                  )
                ),
                Container(
                  height: screenHeight / 2.25,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: (screenHeight / 2.25) - 50.0,
                        // color: AppColors.green,
                        margin: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(children: [
                          Container(
                            width: screenWidth - 60.0,
                            height: ((screenHeight / 2.25) - 50.0) / 7,
                            // color: AppColors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: (screenWidth - 60.0) / 2,
                                      height: (((screenHeight / 2.25) - 50.0) / 7) / 2,
                                      alignment: Alignment.centerRight,
                                      child: AutoSizeText(
                                        'Dont have an account?',
                                        maxLines: 1,
                                        style: TextStyle(letterSpacing: -0.5, fontSize: 15),
                                      )
                                    ),
                                    Container(
                                      width: (screenWidth - 60.0) / 2,
                                      height: (((screenHeight / 2.25) - 50.0) / 7) / 2,
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        ' Create your account,',
                                        maxLines: 1,
                                        style: TextStyle(letterSpacing: -0.5, fontSize: 17, color: AppColors.cyan, fontWeight: FontWeight.bold)
                                      )
                                    )
                                  ]
                                ),
                                Container(
                                  width: screenWidth - 60.0,
                                  height: (((screenHeight / 2.25) - 50.0) / 7) / 2,
                                  alignment: Alignment.center,
                                  child: AutoSizeText(
                                    'it take less than a minute',
                                    maxLines: 1,
                                    style: TextStyle(letterSpacing: -0.5, fontSize: 15, height: 1)
                                  )
                                )
                              ]
                            )
                          ),
                          Container(
                            height: ((screenHeight / 2.25) - 50.0) / 1.168,
                            // color: AppColors.green,
                            child: Column(children: [LoginForm()])
                          )
                        ])
                      )
                    ]
                  )
                )
              ])
            )
          ])
        ])
      )
    );
  }
}
