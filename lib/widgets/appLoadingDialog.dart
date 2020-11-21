import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
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
        Stack(children: [
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: screenHeight / 1.5,
                  // color: AppColors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200.00,
                        height: 200.00,
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
                  height: screenHeight / 9,
                  // color: AppColors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: [
                        Container(
                          width: screenWidth / 2,
                          alignment: Alignment.centerRight,
                          child: AutoSizeText(
                            'Tuto',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 65.00,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold
                            )
                          )
                        ),
                        Container(
                          width: screenWidth / 2,
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            'Fast',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 65.00,
                              color: AppColors.cyan,
                              fontWeight: FontWeight.bold
                            )
                          )
                        )
                      ]),
                      Container(
                        width: screenWidth,
                        child: AutoSizeText(
                          'Copyright © Evertix',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17.00,
                            color: AppColors.white,
                            fontWeight: FontWeight.normal
                          )
                        )
                      )
                    ]
                  )
                )
            ])
          )
        ]),
        Container(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 370.00),
              CircularProgressIndicator(
                strokeWidth: 6,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.cyan),
              )
          ])
        )
      ])
    );
  }
}
