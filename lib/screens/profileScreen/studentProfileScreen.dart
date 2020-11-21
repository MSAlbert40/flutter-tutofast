import 'package:flutter/material.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_fonts.dart';
import 'package:flutter_tutofast/dto/profileResultDTO.dart';
import 'package:flutter_tutofast/screens/complaintScreen/complaintScreen.dart';
import 'package:flutter_tutofast/screens/profileScreen/profileData.dart';

class StudentProfileScreen extends StatefulWidget {

  @override
  _StudentProfileScreenState createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
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
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Container(
                        width: screenWidth,
                        height: screenHeight/ 2.7,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        decoration: BoxDecoration(
                          //color: AppColors.red,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          image: DecorationImage(
                            alignment: Alignment.center,
                            fit: BoxFit.fitHeight,
                            image: AssetImage('assets/images/backgrounds/BKD.png')
                          ),
                        ),
                        child: Align(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text('S', 
                                        style: TextStyle(
                                          fontSize: 45, 
                                          fontFamily: AppFonts.bebasNeue,
                                          color: Colors.white
                                        )
                                      ),
                                      Text('STUDENT', 
                                        style: TextStyle(
                                          fontSize: 25, 
                                          fontFamily: AppFonts.bebasNeue,
                                          color: Colors.white
                                        )
                                      ),
                                    ]
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 45),
                                      Container(
                                        width: screenWidth/3,
                                        height: screenHeight/6,
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius: BorderRadius.circular(100.0),
                                          image: DecorationImage(
                                            image: AssetImage('assets/images/backgrounds/EM.png'),
                                            alignment: Alignment.center,
                                            fit: BoxFit.fill
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(profile.name,
                                        style: TextStyle(
                                          fontSize: 22, 
                                          fontFamily: AppFonts.centuryGothic,
                                          color: Colors.white
                                        ),
                                      ),
                                      Text(profile.lastName,
                                        style: TextStyle(
                                          fontSize: 35, 
                                          fontFamily: AppFonts.bebasNeue,
                                          color: Colors.white
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(profile.creditHours.toString(), 
                                        style: TextStyle(
                                          fontSize: 45, 
                                          fontFamily: AppFonts.bebasNeue,
                                          color: Colors.white
                                        )
                                      ),
                                      Text('HOURS', 
                                        style: TextStyle(
                                          fontSize: 25, 
                                          fontFamily: AppFonts.bebasNeue,
                                          color: Colors.white
                                        )
                                      ),
                                    ]
                                  ),
                                ]
                              ),
                            ]
                          )
                        ),
                      ),
                    ],
                  ),
                ),         
              ],
            ),
            SizedBox(height: 8),
            Align(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Container(
                      width: screenWidth,
                      height: screenHeight/ 2.7,
                      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.7,
                            blurRadius: 0.1,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Personal Information', 
                            style: TextStyle(
                              fontSize: 17, 
                              fontFamily: AppFonts.bebasNeue,
                              color: AppColors.green
                            )
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start, 
                                children: [
                                  SizedBox(height: 11.5),
                                  Text('Surnames', 
                                    style: TextStyle(
                                      fontSize: 16, 
                                      fontFamily: AppFonts.bebasNeue,
                                      color: Colors.black
                                    )
                                  ),
                                  SizedBox(height: 8),
                                  Text('Names', 
                                    style: TextStyle(
                                      fontSize: 16, 
                                      fontFamily: AppFonts.bebasNeue,
                                      color: Colors.black
                                    )
                                  ),
                                  SizedBox(height: 8),
                                  Text('DNI', 
                                    style: TextStyle(
                                      fontSize: 16, 
                                      fontFamily: AppFonts.bebasNeue,
                                      color: Colors.black
                                    )
                                  ),
                                  SizedBox(height: 8),
                                  Text('Email', 
                                    style: TextStyle(
                                      fontSize: 16, 
                                      fontFamily: AppFonts.bebasNeue,
                                      color: Colors.black
                                    )
                                  ),
                                  SizedBox(height: 8),
                                  Text('Birthdate', 
                                    style: TextStyle(
                                      fontSize: 16, 
                                      fontFamily: AppFonts.bebasNeue,
                                      color: Colors.black
                                    )
                                  ),
                                  SizedBox(height: 8),
                                  Text('Address', 
                                    style: TextStyle(
                                      fontSize: 16, 
                                      fontFamily: AppFonts.bebasNeue,
                                      color: Colors.black
                                    )
                                  ),
                                ]
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start, 
                                children: [
                                  SizedBox(height: 8.5),
                                  Text(profile.lastName, 
                                    style: TextStyle(
                                      fontSize: 15, 
                                      fontFamily: AppFonts.centuryGothic,
                                      color: Colors.black
                                    )
                                  ),
                                  SizedBox(height: 8.5),
                                  Text(profile.name, 
                                    style: TextStyle(
                                      fontSize: 15, 
                                      fontFamily: AppFonts.centuryGothic,
                                      color: Colors.black
                                    )
                                  ),
                                  SizedBox(height: 8.5),
                                  Text(profile.dni, 
                                    style: TextStyle(
                                      fontSize: 15, 
                                      fontFamily: AppFonts.centuryGothic,
                                      color: Colors.black
                                    )
                                  ),
                                  SizedBox(height: 8.5),
                                  Text(profile.email, 
                                    style: TextStyle(
                                      fontSize: 15, 
                                      fontFamily: AppFonts.centuryGothic,
                                      color: Colors.black
                                    )
                                  ),
                                  SizedBox(height: 8.5),
                                  Text(profile.birthday, 
                                    style: TextStyle(
                                      fontSize: 15, 
                                      fontFamily: AppFonts.centuryGothic,
                                      color: Colors.black
                                    )
                                  ),
                                  SizedBox(height: 8.5),
                                  Text(profile.address, 
                                    style: TextStyle(
                                      fontSize: 15, 
                                      fontFamily: AppFonts.centuryGothic,
                                      color: Colors.black
                                    )
                                  ),
                                ]
                              ),
                            ],
                          ),         
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Align(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Container(
                      width: screenWidth,
                      height: screenHeight/ 7,
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      decoration: BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.7,
                            blurRadius: 0.1,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: FlatButton(
                        //color: AppColors.red,
                        child: Align(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Complaint Center', 
                                    style: TextStyle(
                                      fontSize: 35, 
                                      fontFamily: AppFonts.bebasNeue,
                                      color: Colors.white
                                    )
                                ),
                                Text('We take care of your problems 24/7', 
                                    style: TextStyle(
                                      fontSize: 12, 
                                      fontFamily: AppFonts.centuryGothic,
                                      color: Colors.white
                                    )
                                ),
                              ],
                            )
                          )
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ComplaintScreen()),
                          );
                        }
                      )
                    )
                  ]
                )
              )
            ) 
          ],
        ),
      ),
    );
  }
}