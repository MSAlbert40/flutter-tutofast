import 'package:flutter/material.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_fonts.dart';
import 'package:flutter_tutofast/screens/complaintScreen/complaintForm.dart';

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          //width: screenWidth,
          //height: screenHeight,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Container(
                      width: screenWidth,
                      height: screenHeight/ 4.5,
                      //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      decoration: BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.7,
                            blurRadius: 0.1,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
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
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: screenWidth,
                      height: screenHeight/ 7,
                      //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
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
                      child: Align(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start, 
                                    children: [
                                      Container(
                                        width: screenWidth/6,
                                        height: screenHeight/12,
                                        decoration: BoxDecoration(
                                          color: AppColors.red,
                                          //borderRadius: BorderRadius.circular(100.0),
                                          image: DecorationImage(
                                            image: AssetImage('assets/images/backgrounds/SD1.png'),
                                            alignment: Alignment.center,
                                            fit: BoxFit.fill
                                          ),
                                        ),
                                      ),
                                    ]
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start, 
                                    children: [
                                      Text('Session Problems', 
                                        style: TextStyle(
                                          fontSize: 26, 
                                          fontFamily: AppFonts.bebasNeue,
                                          color: Colors.white
                                        )
                                      ),
                                      Text('Report your problems', 
                                        style: TextStyle(
                                          fontSize: 12, 
                                          fontFamily: AppFonts.centuryGothic,
                                          color: Colors.white
                                        )
                                      ),
                                    ]
                                  ),
                                ],
                              ),   
                            ],
                          )
                        )
                      ),
                    ),
                    SizedBox(height: 8),
                    /*Container(
                      width: screenWidth,
                      height: screenHeight / 3,
                      //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child:
                      Column(
                        children: [*/
                          ComplaintForm(),
                        //]
                      //)
                    //)
                  ]
                )
              )
            ],
           ),
        )
      )
    );
  }
}