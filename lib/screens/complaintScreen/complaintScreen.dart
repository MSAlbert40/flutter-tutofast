import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_fonts.dart';
import 'package:flutter_tutofast/screens/complaintScreen/complaintForm.dart';

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({Key key}) : super(key: key);

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
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0)
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 25.0),
                      Container(
                        width: screenWidth,
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          'Complaint Center',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 45.0,
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
                            fontSize: 14.5,
                            letterSpacing: -0.5,
                            color: AppColors.white,
                            fontFamily: AppFonts.centuryGothic,
                            height: 0.7
                          )
                        )
                      )
                  ])
                ),
                Container(
                  height: screenHeight / 1.22,
                  // color: AppColors.green,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(height: 25.0),
                      Container(
                        width: screenWidth,
                        child: Column(children: [ComplaintForm()])
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