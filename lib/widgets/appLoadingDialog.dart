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

    return Material(
      // onWillPop: () async => false,
      child: Center(
        //child: Column(children: [
          child: Stack(children: [
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
            Container(
              width: screenWidth,
              height: screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Expanded(
                  //height: screenHeight / 1.3,
                  // color: AppColors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
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
                  height: screenHeight / 4.5,
                  // color: AppColors.green,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Container(
                        width: screenWidth / 2,
                        alignment: Alignment.centerRight,
                        child: AutoSizeText(
                          'Tuto',
                          maxLines: 1,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 60,
                            fontFamily: AppFonts.centuryGothic,
                            fontWeight: FontWeight.bold
                          )
                        ), 
                      ),
                      Container(
                        width: screenWidth / 2,
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          'Fast',
                          maxLines: 1,
                          style: TextStyle(
                            color: AppColors.cyan,
                            fontSize: 60,
                            fontWeight: FontWeight.bold
                          )
                        ), 
                      )
                    ]),
                    Container(
                      width: screenWidth,
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        'Copyright © Evertix',
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.normal
                        )
                      )
                    )
                  ])
                )
              ])
            ),
            Container(
              width: screenWidth,
              height: screenHeight/1.4,
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
        //])
      )
    );
  }
}
