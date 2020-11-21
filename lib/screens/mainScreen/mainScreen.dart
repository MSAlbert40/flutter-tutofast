import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_fonts.dart';
import 'package:hive/hive.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height - 60.0;

    final _sessionbox = Hive.box('session');
    final _isStudent = _sessionbox.get('username') == 'jesus.student';

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              // color: AppColors.blue,
              padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                  width: screenWidth,
                  height: screenHeight - 50.0,
                  // color: AppColors.cyan,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Container(
                      width: screenWidth,
                      height: (screenHeight - 50.0) / 7.5,
                      // color: AppColors.red,
                      child: Row(children: [
                        Container(
                          width: screenWidth / 1.8,
                          height: (screenHeight - 50.0) / 7.5,
                          // color: AppColors.blue,
                          child: Row(children: [
                            Container(
                              width: (screenWidth / 1.8) / 2,
                              child: AutoSizeText(
                                'Tuto',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 60.0,
                                  fontFamily: AppFonts.centuryGothic,
                                  fontWeight: FontWeight.bold
                                )
                              )
                            ),
                            Container(
                              width: (screenWidth / 1.8) / 2,
                              child: AutoSizeText(
                                'Fast',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 60.0,
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: AppFonts.centuryGothic,
                                  fontWeight: FontWeight.bold
                                )
                              )
                            )
                          ])
                        )
                      ])
                    ),
                    Container(
                      width: screenWidth,
                      height: (screenHeight - 50.0) / 1.19,
                      // color: AppColors.green
                      child: SingleChildScrollView(
                        child: Column(children: [
                          SizedBox(height: 2.0),
                          Container(
                            width: screenWidth,
                            height: screenHeight / 8,
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 9.0),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12.0)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: screenWidth - 40.0,
                                  height: ((screenHeight / 8) - 18.0) / 4,
                                  // color: AppColors.blue,
                                  child: AutoSizeText(
                                    _isStudent ? 'Find your tutor' : 'Find your tutoring',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 16.5,
                                      fontFamily: AppFonts.centuryGothic,
                                    )
                                  )
                                ),
                                Container(
                                  width: screenWidth - 40.0,
                                  height: ((screenHeight / 8) - 18.0) / 2,
                                  // color: AppColors.cyan,
                                  child: AutoSizeText(
                                    'IDEAL, SAFE AND RELIABLE',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 37.0,
                                      height: 1,
                                      fontFamily: AppFonts.bebasNeue,
                                      color: Theme.of(context).primaryColor
                                    )
                                  )
                                )
                            ])
                          ),
                          SizedBox(height: 25.0),
                          Container(
                            width: screenWidth,
                            height: screenHeight / 11,
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(12.0)
                            ),
                            child: Column(children: [
                              Container(
                                width: screenWidth - 40.0,
                                height: ((screenHeight / 11) - 24.0) / 1,
                                // color: AppColors.blue,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Container(
                                    width: (screenWidth - 85.0) / 3.8,
                                    // color: AppColors.red,
                                    child: Row(children: [
                                      SizedBox(width: 5.0),
                                      Container(
                                        width: ((screenWidth - 85.0) / 3.8) / 2,
                                        child: AutoSizeText(
                                          _isStudent ? '250' : '450',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 45.0,
                                            fontFamily: AppFonts.bebasNeue,
                                            color: AppColors.white
                                          )
                                        )
                                      ),
                                      SizedBox(width: 4.0),
                                      Container(
                                        width: ((screenWidth - 85.0) / 3.8) / 4,
                                        // color: AppColors.blue,
                                        child: AutoSizeText(
                                          'h',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 30.0,
                                            fontFamily: AppFonts.centuryGothic,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.white
                                          )
                                        )
                                      )
                                    ])
                                  ),
                                  Container(
                                    width: (screenWidth - 85.0) / 1.5,
                                    // color: AppColors.cyan,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                      Container(
                                        width: (screenWidth - 85.0) / 1.5,
                                        height: (((screenHeight / 11) - 24.0) / 1) / 1.7,
                                        // color: AppColors.blue,
                                        child: AutoSizeText(
                                          _isStudent ? 'Credit' : 'Teaching Hours',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            height: 1.5,
                                            fontFamily: AppFonts.centuryGothic,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.white
                                          )
                                        )
                                      ),
                                      Container(
                                        width: (screenWidth - 85.0) / 1.5,
                                        height: (((screenHeight / 11) - 24.0) / 1) / 2.5,
                                        // color: AppColors.cyan,
                                        child: AutoSizeText(
                                          _isStudent ? 'A class requires a minium 2 hours' : 'Hours represent pay per month',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontFamily: AppFonts.centuryGothic,
                                            color: _isStudent ? AppColors.dark : AppColors.white
                                          )
                                        )
                                      )
                                    ])
                                  )
                                ])
                              )
                            ])
                          ),
                          SizedBox(height: 25.0),
                          Container(
                            width: screenWidth,
                            height: screenHeight / 3.4,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12.0)
                            ),
                          ),
                          SizedBox(height: 25.0),
                          Container(
                            width: screenWidth,
                            height: screenHeight / 6.3,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12.0)
                            ),
                          )
                        ])
                      )
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
