import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_fonts.dart';
import 'package:flutter_tutofast/dto/profileResultDTO.dart';
import 'package:flutter_tutofast/screens/profileScreen/profileData.dart';
import 'package:flutter_tutofast/screens/profileScreen/profileScreen.dart';
import 'package:flutter_tutofast/screens/reviewScreen/reviewData.dart';
import 'package:flutter_tutofast/widgets/buttons/microButton.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ReviewForm extends StatefulWidget {
  @override
  _ReviewFormState createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  ProfileData profileData;
  ProfileResultDTO profile;
  ReviewData reviewData;
  List reviews;
  List ratings;

  @override
  void initState() {
    profileData = ProfileData();
    profile = ProfileResultDTO();
    reviewData = ReviewData();
    reviews = List();
    ratings = List();

    loadProfile();
    loadReview();
    super.initState();
  }

  Future loadProfile() async {
    ProfileResultDTO result = await profileData.getDataProfile();
    setState(() {
      profile = result;
    });    
  }

  Future loadReview() async {
    List resultReviews = await reviewData.getDataReview();
    List resultRatings = await reviewData.getRatings(resultReviews);
    setState(() {
      reviews = resultReviews;
      ratings = resultRatings;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height - 54.0;

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
                    height: screenHeight / 6,
                    child: Stack(children: [
                      Container(
                        height: screenHeight / 6,
                        decoration: BoxDecoration(
                          // color: AppColors.red,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0)
                          ),
                          image: DecorationImage(
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/backgrounds/BUT.jpg')
                          )
                        ),
                      ),
                      Container(
                        height: screenHeight / 6,
                        decoration: BoxDecoration(
                          color: AppColors.dark.withOpacity(0.30),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0)
                          )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 29.0),
                            Container(
                              width: screenWidth,
                              alignment: Alignment.center,
                              child: AutoSizeText(
                                profile.name ?? 'name',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 22.5,
                                  letterSpacing: -0.5,
                                  color: AppColors.white,
                                  fontFamily: AppFonts.centuryGothic,
                                  height: 1
                                )
                              )
                            ),
                            Container(
                              width: screenWidth,
                              alignment: Alignment.center,
                              child: AutoSizeText(
                                profile.lastName ?? 'lastName',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 46.0,
                                  color: AppColors.white,
                                  fontFamily: AppFonts.bebasNeue,
                                  height: 1
                                )
                              )
                            )
                        ])
                      )
                    ])
                  ),
                  Container(
                    height: screenHeight / 29
                  ),
                  Container(
                    height: screenHeight / 1.26,
                    // color: AppColors.green,
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth,
                          child: Column(children: [
                            Container(
                              width: screenWidth,
                              height: screenHeight / 6,
                              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                color: AppColors.blue,
                                borderRadius: BorderRadius.circular(12.0)
                              ),
                              child: Row(children: [
                                Container(
                                  height: (screenHeight / 6) - 30.0,
                                  width: (screenWidth - 74.0) / 3,
                                  // color: AppColors.cyan,
                                  padding: EdgeInsets.symmetric(horizontal: 9.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                    Container(
                                      width: (screenWidth - 74.0) / 3,
                                      height: ((screenHeight / 6) - 30.0) / 1.43,
                                      alignment: Alignment.bottomRight,
                                      child: AutoSizeText(
                                        //profile.averageStars.toString() ?? '0.0',
                                        ratings[0].toStringAsFixed(1) ?? '0.0',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 90.0,
                                          color: AppColors.white,
                                          fontFamily: AppFonts.bebasNeue,
                                          height: 0.2
                                        )
                                      )
                                    ),
                                    Container(
                                      width: (screenWidth - 74.0) / 3,
                                      height: ((screenHeight / 6) - 30.0) / 3.4,
                                      alignment: Alignment.bottomRight,
                                      child: AutoSizeText(
                                        'Stars',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 26.0,
                                          color: AppColors.white,
                                          fontFamily: AppFonts.centuryGothic,
                                          height: 1
                                        )
                                      )
                                    )
                                  ])
                                ),
                                Container(
                                  width: (screenWidth - 74.0) / 1.5,
                                  // color: AppColors.green,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    Row(children: [
                                      Container(
                                        width: ((screenWidth - 74.0) / 1.5) / 12,
                                        height: 15,
                                        // color: AppColors.red,
                                        child: AutoSizeText(
                                          '5',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: AppColors.white,
                                            fontFamily: AppFonts.centuryGothic,
                                            height: 1
                                          )
                                        )
                                      ),
                                      Container(
                                        width: ((screenWidth - 74.0) / 1.5) / 1.1,
                                        height: 15,
                                        // color: AppColors.cyan,
                                        child: LinearPercentIndicator(
                                          width: MediaQuery.of(context).size.width / 2.09,
                                          lineHeight: 8.0,
                                          percent: ratings[5],
                                          progressColor: AppColors.white,
                                        ),
                                      )
                                    ]),
                                    SizedBox(height: 6.0),
                                    Row(children: [
                                      Container(
                                        width: ((screenWidth - 74.0) / 1.5) / 12,
                                        height: 15,
                                        // color: AppColors.red,
                                        child: AutoSizeText(
                                          '4',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: AppColors.white,
                                            fontFamily: AppFonts.centuryGothic,
                                            height: 1
                                          )
                                        )
                                      ),
                                      Container(
                                        width: ((screenWidth - 74.0) / 1.5) / 1.1,
                                        height: 15,
                                        // color: AppColors.cyan,
                                        child: LinearPercentIndicator(
                                          width: MediaQuery.of(context).size.width / 2.09,
                                          lineHeight: 8.0,
                                          percent: ratings[4],
                                          progressColor: AppColors.white,
                                        ),
                                      )
                                    ]),
                                    SizedBox(height: 6.0),
                                    Row(children: [
                                      Container(
                                        width: ((screenWidth - 74.0) / 1.5) / 12,
                                        height: 15,
                                        // color: AppColors.red,
                                        child: AutoSizeText(
                                          '3',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: AppColors.white,
                                            fontFamily: AppFonts.centuryGothic,
                                            height: 1
                                          )
                                        )
                                      ),
                                      Container(
                                        width: ((screenWidth - 74.0) / 1.5) / 1.1,
                                        height: 15,
                                        // color: AppColors.cyan,
                                        child: LinearPercentIndicator(
                                          width: MediaQuery.of(context).size.width / 2.09,
                                          lineHeight: 8.0,
                                          percent: ratings[3],
                                          progressColor: AppColors.white,
                                        ),
                                      )
                                    ]),
                                    SizedBox(height: 6.0),
                                    Row(children: [
                                      Container(
                                        width: ((screenWidth - 74.0) / 1.5) / 12,
                                        height: 15,
                                        // color: AppColors.red,
                                        child: AutoSizeText(
                                          '2',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: AppColors.white,
                                            fontFamily: AppFonts.centuryGothic,
                                            height: 1
                                          )
                                        )
                                      ),
                                      Container(
                                        width: ((screenWidth - 74.0) / 1.5) / 1.1,
                                        height: 15,
                                        // color: AppColors.cyan,
                                        child: LinearPercentIndicator(
                                          width: MediaQuery.of(context).size.width / 2.09,
                                          lineHeight: 8.0,
                                          percent: ratings[2],
                                          progressColor: AppColors.white,
                                        ),
                                      )
                                    ]),
                                    SizedBox(height: 6.0),
                                    Row(children: [
                                      Container(
                                        width: ((screenWidth - 74.0) / 1.5) / 12,
                                        height: 15,
                                        // color: AppColors.red,
                                        child: AutoSizeText(
                                          '3',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: AppColors.white,
                                            fontFamily: AppFonts.centuryGothic,
                                            height: 1
                                          )
                                        )
                                      ),
                                      Container(
                                        width: ((screenWidth - 74.0) / 1.5) / 1.1,
                                        height: 15,
                                        // color: AppColors.cyan,
                                        child: LinearPercentIndicator(
                                          width: MediaQuery.of(context).size.width / 2.09,
                                          lineHeight: 8.0,
                                          percent: ratings[4],
                                          progressColor: AppColors.white,
                                        ),
                                      )
                                    ]),
                                  ])
                                )
                              ])
                            ),
                            Container(
                              height: screenHeight / 1.6,
                              // color: AppColors.cyan,
                              child: SingleChildScrollView(
                                child: Column(children: [
                                  SizedBox(height: 25.0),
                                  Container(
                                    width: screenWidth,
                                    height: screenHeight / 3,
                                    padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 15.0),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(12.0)
                                    ),
                                    child: Column(children: [
                                      Container(
                                        width: screenWidth,
                                        height: ((screenHeight / 3) - 30.0) / 6,
                                        alignment: Alignment.centerLeft,
                                        // color: AppColors.cyan,
                                        child: AutoSizeText(
                                          'Total Reviews',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 30.0,
                                            letterSpacing: -0.5,
                                            color: AppColors.blue,
                                            fontFamily: AppFonts.bebasNeue,
                                          )
                                        )
                                      ),
                                      Container(
                                        width: screenWidth,
                                        //height: ((screenHeight / 3) - 30.0) / 4,
                                        //alignment: Alignment.centerLeft,
                                        // color: AppColors.cyan,
                                          
                                        child: SingleChildScrollView(
                                          child: Column (
                                            children: [
                                              
                                              for(var item in reviews)
                                                Column(
                                                  children : [
                                                    Container(
                                                      width: screenWidth,
                                                      height: ((screenHeight / 3) - 30.0) / 12,
                                                      alignment: Alignment.centerLeft,
                                                      //color: AppColors.cyan,
                                                      child: AutoSizeText(
                                                        item.student.name + ' ' + item.student.lastName,
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                          fontSize: 1.0,
                                                          letterSpacing: -0.5,
                                                          fontFamily: AppFonts.centuryGothic,
                                                        )
                                                      )
                                                    ),
                                                    Container(
                                                      width: screenWidth,
                                                      height: ((screenHeight / 3) - 30.0) / 4,
                                                      alignment: Alignment.centerLeft,
                                                      //color: AppColors.cyan,
                                                      child: AutoSizeText(
                                                        item.description ?? 'description',
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                          fontSize: 1.0,
                                                          letterSpacing: -0.5,
                                                          fontFamily: AppFonts.centuryGothic,
                                                        )
                                                      )
                                                    ),
                                                    Container(
                                                      width: screenWidth,
                                                      height: ((screenHeight / 3) - 30.0) / 12,
                                                      alignment: Alignment.centerLeft,
                                                      //color: AppColors.lead,
                                                      child: Row(
                                                        children: [
                                                          for(int i = 1; i <= 5; i++)
                                                            Image(
                                                              image: AssetImage(
                                                                i <= item.stars ? 
                                                                'assets/images/icons/EQ1.png' :
                                                                'assets/images/icons/EE1.png'
                                                              ),
                                                            )
                                                        ],
                                                      )
                                                    )
                                                  ]
                                                )
                                            ],
                                          )
                                        )
                                      )
                                    ])
                                  ),
                                  SizedBox(height: 25.0),
                                  MicroButton(
                                    width: screenWidth,
                                    height: screenHeight / 18,
                                    alignment: Alignment.center,
                                    color: AppColors.cyan,
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: AutoSizeText(
                                      'Return',
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: AppColors.white,
                                        fontFamily: AppFonts.centuryGothic
                                      )
                                    ),
                                    onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => ProfileScreen()
                                      ));
                                    }
                                  )
                                ])
                              )
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
