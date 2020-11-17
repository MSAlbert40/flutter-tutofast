import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/screens/loginScreen/loginScreen.dart';
import 'package:flutter_tutofast/screens/subcriptionScreen/subcriptionForm.dart';
import 'package:flutter_tutofast/widgets/buttons/microButton.dart';

class SubcriptionScreen extends StatelessWidget {
  const SubcriptionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    var active = true;

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
                  image: AssetImage('assets/images/backgrounds/BPS.jpg')
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
                  // color: AppColors.red,
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
                    ]
                  )
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
                      // color: AppColors.red,
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
                                  'Subcription',
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
                                margin: EdgeInsets.symmetric(horizontal: 15.0),
                                child: AutoSizeText(
                                  'We need you to select one of the subscriptions on the back to finish the registration process.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    letterSpacing: -0.5,
                                    height: 1
                                  )
                                )
                              )
                            ]
                          )
                        ),
                        Container(
                          height: ((screenHeight / 1.304) - 50.0) / 1.125,
                          // color: AppColors.green,
                          child: Column(children: [SubcriptionForm()])
                        )
                      ])
                    )
                  ])
                )
              ])
            )
          ])
        ])
      )
    );
  }
}