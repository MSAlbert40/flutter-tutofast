import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_fonts.dart';
import 'package:get/get.dart';

class AppLoadingDialog extends StatelessWidget {
  const AppLoadingDialog({Key key}) : super(key: key);
  static void hide() => Get.back();
  static void show({Key key}) =>
      Get.dialog(AppLoadingDialog(key: key), barrierDismissible: false);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(children: [
        Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/backgrounds/BT.jpg')
            )
          )
        ),
        Container(
          width: screenWidth,
          height: screenHeight,
          color: AppColors.blue.withOpacity(0.55)
        ),
        Stack(
          children: [
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
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
            Positioned(
              left: 0,
              right: 0,
              bottom: 30,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    'Tuto',
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: AppFonts.centuryGothic,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    )
                  ),
                  Text(
                    'Fast',
                    style: TextStyle(
                      color: AppColors.cyan,
                      fontFamily: AppFonts.centuryGothic,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    )
                  )
                ]),
                Text(
                  'Copyright © Evertix',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.normal
                  )
                )
              ])
            )
          ]
        ),
        Container(
          width: screenWidth,
          height: screenHeight,
          padding: EdgeInsets.symmetric(horizontal: 80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(height: 370),
            CircularProgressIndicator(
              // backgroundColor: AppColors.white,
              strokeWidth: 7,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.cyan)
            )
          ])
        )
      ])
    );
  }
}
