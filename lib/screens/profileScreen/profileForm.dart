import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_fonts.dart';
import 'package:flutter_tutofast/dto/profileResultDTO.dart';
import 'package:flutter_tutofast/screens/complaintScreen/complaintScreen.dart';
import 'package:flutter_tutofast/screens/profileScreen/profileData.dart';
import 'package:flutter_tutofast/widgets/buttons/microButton.dart';

import 'package:hive/hive.dart';

class ProfileForm extends StatefulWidget {

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  ProfileData profileData;
  ProfileResultDTO profile;

  @override
  void initState() {
    profileData = ProfileData();
    profile = ProfileResultDTO();

    loadProfile();
    super.initState();
  }

  Future loadProfile() async {
    ProfileResultDTO result = await profileData.getDataProfile();

    setState(() {
      profile = result;
    });    
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height - 54.0;
    
    // final _isRole = false;
    final _sessionbox = Hive.box('session');
    final _isRole = _sessionbox.get('role') == 'ROLE_STUDENT';

    final teacherInfo = Column(children: [
      Container(
        width: screenWidth,
        height: screenHeight / 14,
        decoration: BoxDecoration(
          // color: AppColors.blue,
          borderRadius: BorderRadius.circular(12.0)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: (screenWidth - 44.0) / 3.3,
              height: screenHeight / 14,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(12.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: (((screenWidth - 44.0) / 3.3) - 20.0) / 2,
                    height: (screenHeight / 14) / 1.5,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    // color: AppColors.cyan,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: (((screenWidth - 44.0) / 3.3) - 20.0) / 2,
                          height: ((screenHeight / 14) / 1.5) / 1.4,
                          alignment: Alignment.centerRight,
                          child: AutoSizeText(
                            profile.averageStars.toString() ?? '0.0',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 28.0,
                              fontFamily: AppFonts.bebasNeue,
                              color: AppColors.white,
                              height: 1
                            )
                          )
                        ),
                        Container(
                          width: (((screenWidth - 44.0) / 3.3) - 20.0) / 2,
                          height: ((screenHeight / 14) / 1.5) / 4,
                          alignment: Alignment.centerRight,
                          child: AutoSizeText(
                            'Starts',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 5.0,
                              letterSpacing: -0.5,
                              fontFamily: AppFonts.centuryGothic,
                              color: AppColors.white,
                              height: 0.4
                            )
                          )
                        )
                    ])
                  ),
                  Container(
                    width: (((screenWidth - 44.0) / 3.3) - 20.0) / 2.5,
                    height: (screenHeight / 14) / 1.5,
                    decoration: BoxDecoration(
                      // color: AppColors.red,
                      image: DecorationImage(
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/icons/TIE.png')
                      )
                    )
                  )
              ])
            ),
           Container(
              width: (screenWidth - 44.0) / 3.3,
              height: screenHeight / 14,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(12.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: (((screenWidth - 44.0) / 3.3) - 20.0) / 2,
                    height: (screenHeight / 14) / 1.5,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    // color: AppColors.cyan,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: (((screenWidth - 44.0) / 3.3) - 20.0) / 2,
                          height: ((screenHeight / 14) / 1.5) / 1.4,
                          alignment: Alignment.centerRight,
                          child: AutoSizeText(
                            profile.averageStars.toString() ?? '0',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 28.0,
                              fontFamily: AppFonts.bebasNeue,
                              color: AppColors.white,
                              height: 1
                            )
                          )
                        ),
                        Container(
                          width: (((screenWidth - 44.0) / 3.3) - 20.0) / 2,
                          height: ((screenHeight / 14) / 1.5) / 4,
                          alignment: Alignment.centerRight,
                          child: AutoSizeText(
                            'Soles',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 5.0,
                              letterSpacing: -0.5,
                              fontFamily: AppFonts.centuryGothic,
                              color: AppColors.white,
                              height: 0.4
                            )
                          )
                        )
                    ])
                  ),
                  Container(
                    width: (((screenWidth - 44.0) / 3.3) - 20.0) / 2.5,
                    height: (screenHeight / 14) / 1.5,
                    decoration: BoxDecoration(
                      // color: AppColors.red,
                      image: DecorationImage(
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/icons/TIC.png')
                      )
                    )
                  )
              ])
            ),
            Container(
              width: (screenWidth - 44.0) / 3.3,
              height: screenHeight / 14,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(12.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: (((screenWidth - 44.0) / 3.3) - 20.0) / 2,
                    height: (screenHeight / 14) / 1.5,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    // color: AppColors.cyan,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: (((screenWidth - 44.0) / 3.3) - 20.0) / 2,
                          height: ((screenHeight / 14) / 1.5) / 1.4,
                          alignment: Alignment.centerRight,
                          child: AutoSizeText(
                            profile.averageStars.toString() ?? '0',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 28.0,
                              fontFamily: AppFonts.bebasNeue,
                              color: AppColors.white,
                              height: 1
                            )
                          )
                        ),
                        Container(
                          width: (((screenWidth - 44.0) / 3.3) - 20.0) / 2,
                          height: ((screenHeight / 14) / 1.5) / 4,
                          alignment: Alignment.centerRight,
                          child: AutoSizeText(
                            'Class',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 5.0,
                              letterSpacing: -0.5,
                              fontFamily: AppFonts.centuryGothic,
                              color: AppColors.white,
                              height: 0.4
                            )
                          )
                        )
                    ])
                  ),
                  Container(
                    width: (((screenWidth - 44.0) / 3.3) - 20.0) / 2.5,
                    height: (screenHeight / 14) / 1.5,
                    decoration: BoxDecoration(
                      // color: AppColors.red,
                      image: DecorationImage(
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/icons/TIG.png')
                      )
                    )
                  )
              ])
            ), 
        ])
      ),
      SizedBox(height: 25.0),
      Container(
        width: screenWidth,
        height: screenHeight / 7.2,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.0)
        )
      )
    ]);

    final studentInfo = Column(children: [
      Container(
        width: screenWidth,
        height: screenHeight / 10.5,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: AppColors.cyan,
          borderRadius: BorderRadius.circular(12.0)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth,
              height: (screenHeight / 10.5) - 24.0,
              // color: AppColors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                  width: (screenWidth - 84.0) / 2.6,
                  height: (screenHeight / 10.5) - 24.0,
                  // color: AppColors.green,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: AutoSizeText(
                    'Free',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 45.0,
                      color: AppColors.white,
                      fontFamily: AppFonts.centuryGothic,
                      fontWeight: FontWeight.bold
                    )
                  )
                ),
                Container(
                  width: (screenWidth - 84.0) / 1.65,
                  height: (screenHeight / 10.5) - 24.0,
                  // color: AppColors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          '7 days trial',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 18.0,
                            height: 1.5,
                            fontFamily: AppFonts.centuryGothic,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white
                          )
                        )
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          'Your credit to use is 2 hours',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 13.5,
                            fontFamily: AppFonts.centuryGothic,
                            fontWeight: FontWeight.normal,
                            color: AppColors.white
                          )
                        )
                      )
                  ])
                )
              ])
            )
        ])
      )
    ]);

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
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0)
                        ),
                        image: DecorationImage(
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                          image: _isRole ? AssetImage('assets/images/backgrounds/BUS.jpg') : AssetImage('assets/images/backgrounds/BUT.jpg')
                        )
                      )
                    ),
                    Container(
                      height: screenHeight / 3.3,
                      decoration: BoxDecoration(
                        color: AppColors.dark.withOpacity(0.30),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0)
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
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: AutoSizeText(
                                              _isRole ? 'S' : 'T',
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 45.0,
                                                color: AppColors.white,
                                                fontFamily: AppFonts.bebasNeue,

                                              )
                                            )
                                          ),
                                          Container(
                                            child: AutoSizeText(
                                              _isRole ? 'Student' : 'Teacher',
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: AppColors.white,
                                                fontFamily: AppFonts.bebasNeue,
                                                height: 0.5
                                              )
                                            )
                                          )
                                      ])
                                    ),
                                    Container(
                                      width: (screenWidth - 44.0) / 2.8,
                                      height: (screenHeight / 3.3) / 2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100.0),
                                        image: DecorationImage(
                                          alignment: Alignment.center,
                                          fit: BoxFit.cover,
                                          image: _isRole ? AssetImage('assets/images/backgrounds/IUS.png') : AssetImage('assets/images/backgrounds/IUT.png')
                                        )
                                      )
                                    ),
                                    Container(
                                      width: (screenWidth - 44.0) / 3.5,
                                      height: (screenHeight / 3.3) / 2,
                                      // color: AppColors.green,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: AutoSizeText(
                                              profile.creditHours.toString() ?? '0',
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 45.0,
                                                color: AppColors.white,
                                                fontFamily: AppFonts.bebasNeue,

                                              )
                                            )
                                          ),
                                          Container(
                                            child: AutoSizeText(
                                              'Hours',
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: AppColors.white,
                                                fontFamily: AppFonts.bebasNeue,
                                                height: 0.5
                                              )
                                            )
                                          )
                                      ])
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
                                    profile.name ?? 'Names',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 19.0,
                                      color: AppColors.white,
                                      fontFamily: AppFonts.centuryGothic,
                                      height: 1
                                    )
                                  )
                                ),
                                Container(
                                  height: ((screenHeight / 3.3) / 3.2) / 2.1,
                                  alignment: Alignment.topCenter,
                                  child: AutoSizeText(
                                    profile.lastName ?? 'Surnames',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 35.0,
                                      color: AppColors.white,
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
                  height: screenHeight / 29
                ),
                Container(
                  height: screenHeight / 1.52,
                  // color: AppColors.green,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      _isRole ? studentInfo : teacherInfo,
                      SizedBox(height: 25.0),
                      Container(
                        width: screenWidth,
                        height: screenHeight / 2.9,
                        padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 15.0),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                        child: Column(children: [
                          Container(
                            width: screenWidth,
                            height: (screenHeight / 2.9) - 30.0,
                            child: Column(children: [
                              Container(
                                width: screenWidth,
                                height: ((screenHeight / 2.9) - 30.0) / 8,
                                alignment: Alignment.centerLeft,
                                // color: AppColors.cyan,
                                child: AutoSizeText(
                                  'Personal Information',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 21.0,
                                    letterSpacing: -0.5,
                                    color: _isRole ? AppColors.green : AppColors.blue,
                                    fontFamily: AppFonts.centuryGothic,
                                    fontWeight: FontWeight.bold
                                  )
                                )
                              ),
                              SizedBox(height: 10.0),
                              Row(children: [
                                Container(
                                  width: (screenWidth - 88.0) / 3.3,
                                  child: AutoSizeText(
                                    'Surnames',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 16.5,
                                      letterSpacing: -0.5,
                                      fontFamily: AppFonts.centuryGothic,
                                      fontWeight: FontWeight.bold
                                    )
                                  )
                                ),
                                Container(
                                  width: (screenWidth - 88.0) / 1.44,
                                  child: AutoSizeText(
                                    profile.lastName ?? 'Surnames',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      letterSpacing: -0.5,
                                      fontFamily: AppFonts.centuryGothic,
                                    )
                                  )
                                )
                              ]),
                              SizedBox(height: 12.0),
                              Row(children: [
                                Container(
                                  width: (screenWidth - 88.0) / 3.3,
                                  child: AutoSizeText(
                                    'Names',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 16.5,
                                      letterSpacing: -0.5,
                                      fontFamily: AppFonts.centuryGothic,
                                      fontWeight: FontWeight.bold
                                    )
                                  )
                                ),
                                Container(
                                  width: (screenWidth - 88.0) / 1.44,
                                  child: AutoSizeText(
                                    profile.name ?? 'Names',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      letterSpacing: -0.5,
                                      fontFamily: AppFonts.centuryGothic,
                                    )
                                  )
                                )
                              ]),
                              SizedBox(height: 12.0),
                              Row(children: [
                                Container(
                                  width: (screenWidth - 88.0) / 3.3,
                                  child: AutoSizeText(
                                    'DNI',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 16.5,
                                      letterSpacing: -0.5,
                                      fontFamily: AppFonts.centuryGothic,
                                      fontWeight: FontWeight.bold
                                    )
                                  )
                                ),
                                Container(
                                  width: (screenWidth - 88.0) / 1.44,
                                  child: AutoSizeText(
                                    profile.dni ?? 'DNI',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      letterSpacing: -0.5,
                                      fontFamily: AppFonts.centuryGothic,
                                    )
                                  )
                                )
                              ]),
                              SizedBox(height: 12.0),
                              Row(children: [
                                Container(
                                  width: (screenWidth - 88.0) / 3.3,
                                  child: AutoSizeText(
                                    'Email',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 16.5,
                                      letterSpacing: -0.5,
                                      fontFamily: AppFonts.centuryGothic,
                                      fontWeight: FontWeight.bold
                                    )
                                  )
                                ),
                                Container(
                                  width: (screenWidth - 88.0) / 1.44,
                                  child: AutoSizeText(
                                    profile.email ?? 'Email',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      letterSpacing: -0.5,
                                      fontFamily: AppFonts.centuryGothic,
                                    )
                                  )
                                )
                              ]),
                              SizedBox(height: 12.0),
                              Row(children: [
                                Container(
                                  width: (screenWidth - 88.0) / 3.3,
                                  child: AutoSizeText(
                                    'Birthdate',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 16.5,
                                      letterSpacing: -0.5,
                                      fontFamily: AppFonts.centuryGothic,
                                      fontWeight: FontWeight.bold
                                    )
                                  )
                                ),
                                Container(
                                  width: (screenWidth - 88.0) / 1.44,
                                  child: AutoSizeText(
                                    profile.birthday ?? 'Birthday',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      letterSpacing: -0.5,
                                      fontFamily: AppFonts.centuryGothic,
                                    )
                                  )
                                )
                              ]),
                              SizedBox(height: 12.0),
                              Row(children: [
                                Container(
                                  width: (screenWidth - 88.0) / 3.3,
                                  child: AutoSizeText(
                                    'Address',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 16.5,
                                      letterSpacing: -0.5,
                                      fontFamily: AppFonts.centuryGothic,
                                      fontWeight: FontWeight.bold
                                    )
                                  )
                                ),
                                Container(
                                  width: (screenWidth - 88.0) / 1.44,
                                  child: AutoSizeText(
                                    profile.address ?? 'Address',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      letterSpacing: -0.5,
                                      fontFamily: AppFonts.centuryGothic,
                                    )
                                  )
                                )
                              ])
                            ])
                          )
                        ])
                      ),
                      SizedBox(height: 25.0),
                      MicroButton(
                        width: screenWidth,
                        height: screenHeight / 9.5,
                        color: AppColors.red,
                        borderRadius: BorderRadius.circular(12.0),
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ComplaintScreen()
                          ));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth,
                              alignment: Alignment.center,
                              child: AutoSizeText(
                                'Complaint Center',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 40.0,
                                  color: AppColors.white,
                                  fontFamily: AppFonts.bebasNeue,
                                  height: 1
                                )
                              )
                            ),
                            Container(
                              width: screenWidth,
                              alignment: Alignment.center,
                              child: AutoSizeText(
                                'We take care of your problems 24/7',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 13.5,
                                  letterSpacing: -0.5,
                                  color: AppColors.white,
                                  fontFamily: AppFonts.centuryGothic,
                                  height: 0.5
                                )
                              )
                            )
                        ])
                      ),
                      Container(
                        width: screenWidth,
                        height: _isRole ? 0.0 : 25.0,
                      )
                    ])
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