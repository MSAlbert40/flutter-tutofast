import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_fonts.dart';
import 'package:flutter_tutofast/screens/profileScreen/studentProfileScreen.dart';
import 'package:flutter_tutofast/screens/profileScreen/teacherProfileScreen.dart';
import 'package:hive/hive.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height - 54.0;
    final _isRole = true;
    // final _sessionbox = Hive.box('session');
    // final _isRole = _sessionbox.get('role') == 'ROLE_STUDENT';

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              // color: AppColors.cyan,
              margin: EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(children: [
                Container(
                  height: screenHeight / 3.3,
                  child: Stack(children: [
                    Container(
                      height: screenHeight / 3.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)
                        ),
                        image: DecorationImage(
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                          image: _isRole ? AssetImage('assets/images/backgrounds/BUT.jpg') : AssetImage('assets/images/backgrounds/BUS.jpg')
                        )
                      )
                    ),
                    Container(
                      height: screenHeight / 3.3,
                      decoration: BoxDecoration(
                        color: AppColors.dark.withOpacity(0.30),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: (screenHeight / 3.3) / 2,
                            // color: AppColors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: (screenWidth - 44.0) / 3.5,
                                      height: (screenHeight / 3.3) / 2,
                                      // color: AppColors.red,
                                    ),
                                    Container(
                                      width: (screenWidth - 44.0) / 2.8,
                                      height: (screenHeight / 3.3) / 2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100.0),
                                        image: DecorationImage(
                                          alignment: Alignment.center,
                                          fit: BoxFit.cover,
                                          image: _isRole ? AssetImage('assets/images/backgrounds/IUT.png') : AssetImage('assets/images/backgrounds/IUS.png')
                                        )
                                      )
                                    ),
                                    Container(
                                      width: (screenWidth - 44.0) / 3.5,
                                      height: (screenHeight / 3.3) / 2,
                                      // color: AppColors.green,
                                    )
                                ])
                            ])
                          ),
                          Container(
                            height: (screenHeight / 3.3) / 3.2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: ((screenHeight / 3.3) / 3.2) / 3.5,
                                  alignment: Alignment.bottomCenter,
                                  child: AutoSizeText(
                                    'Nicolas Alexander',
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 19.0,
                                      height: 1
                                    )
                                  )
                                ),
                                Container(
                                  height: ((screenHeight / 3.3) / 3.2) / 2.1,
                                  alignment: Alignment.topCenter,
                                  child: AutoSizeText(
                                    'Quiroz Risopatron',
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 35.0,
                                      fontFamily: AppFonts.bebasNeue,
                                      height: 1.1
                                    )
                                  )
                                )
                            ])
                          )
                      ])
                    )
                  ])
                ),
                Container(
                  height: screenHeight / 1.44,
                  //color: AppColors.green
                )
              ])
            )
          ])
        ])
      )
    );
  }
}
