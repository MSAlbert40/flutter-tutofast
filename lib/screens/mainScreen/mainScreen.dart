import 'package:flutter/material.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_fonts.dart';
import 'package:hive/hive.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final _sessionbox = Hive.box('session');
    final _isStudent = _sessionbox.get('username') == 'jesus.student';

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 44),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenWidth,
              height: screenHeight / 10,
              decoration: BoxDecoration(
                // color: AppColors.blue
              ),
              child: Row(children: [
                Text('Tuto', style: TextStyle(fontSize: 60, fontFamily: AppFonts.centuryGothic, fontWeight: FontWeight.bold)),
                Text('Fast', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 60, fontFamily: AppFonts.centuryGothic, fontWeight: FontWeight.bold)),
              ])
            ),
            SizedBox(height: 5),
            Container(
              width: screenWidth,
              height: screenHeight / 9,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.0)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Row(children: [
                    Text('Find your ', style: TextStyle(fontSize: 16.5, fontFamily: AppFonts.centuryGothic)),
                    _isStudent ? Text('tutor', style: TextStyle(fontSize: 16.5, fontFamily: AppFonts.centuryGothic)) : Text('tutoring', style: TextStyle(fontSize: 15.5, fontFamily: AppFonts.centuryGothic)),
                  ]),
                  Text('IDEAL, SAFE AND RELIABLE',
                    style: TextStyle(
                      fontFamily: AppFonts.bebasNeue,
                      fontSize: 37,
                      color: Theme.of(context).primaryColor
                    )
                  )
                ]
              )
            ),
            SizedBox(height: 25),
            Container(
              width: screenWidth,
              height: screenHeight / 12,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12.0)
              ),
              child: Row(children: [
                Text(
                  _isStudent
                  ? '250'
                  : '450',
                  style: TextStyle(
                      fontFamily: AppFonts.bebasNeue,
                      fontSize: 42,
                      color: AppColors.white,
  
                  )
                ),
                SizedBox(width: 3),
                Text(
                  'h', style: TextStyle(
                    fontSize: 29, 
                    fontFamily: AppFonts.centuryGothic,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white  
                  )
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6),
                    Text(
                        _isStudent ? 'Credit' : 'Teaching Hours',
                        style: TextStyle(
                          fontFamily: AppFonts.centuryGothic,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: AppColors.white
                        )
                    ),
                    Text(
                      _isStudent
                      ? 'A class requires a minium 2 hours'
                      : 'Hours represent pay per month',
                      style: TextStyle(
                        fontSize: 14, 
                        fontFamily: AppFonts.centuryGothic,
                      )
                    ),
                  ],
                )
              ]),
            ),
            SizedBox(height: 25),
            Container(
              width: screenWidth,
              height: screenHeight / 3.6,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.0)
              ),
              child: Container(
                width: double.infinity,
                // child: HomeForm(),
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: screenWidth,
              height: screenHeight / 6.4,
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.0)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text('Choose the ', style: TextStyle(fontFamily: AppFonts.centuryGothic, fontSize: 13),),
                    Text('Course', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 13, fontFamily: AppFonts.centuryGothic, fontWeight: FontWeight.bold)),
                  ],),
                  SizedBox(height: 10), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 66,
                        height: 67,
                        padding: EdgeInsets.symmetric(vertical: 7),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.5, color: AppColors.gray.withOpacity(0.7))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Container(
                            height: 34,
                            width: 34,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/course-math.png')
                              )
                            )
                          ),
                          SizedBox(height: 1),
                          Text('MATHEMATICS', style: TextStyle(fontFamily: AppFonts.bebasNeue))
                        ],),
                      ),
                      Container(
                        width: 66,
                        height: 67,
                        padding: EdgeInsets.symmetric(vertical: 7),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.5, color: AppColors.gray.withOpacity(0.7))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Container(
                            height: 34,
                            width: 34,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/course-history.png')
                              )
                            )
                          ),
                          SizedBox(height: 1),
                          Text('HISTORY', style: TextStyle(fontFamily: AppFonts.bebasNeue))
                        ],),
                      ),
                      Container(
                        width: 66,
                        height: 67,
                        padding: EdgeInsets.symmetric(vertical: 7),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.5, color: AppColors.gray.withOpacity(0.7))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Container(
                            height: 34,
                            width: 34,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/course-chemistry.png')
                              )
                            )
                          ),
                          SizedBox(height: 1),
                          Text('CHEMISTRY', style: TextStyle(fontFamily: AppFonts.bebasNeue))
                        ],),
                      ),
                      Container(
                        width: 66,
                        height: 67,
                        padding: EdgeInsets.symmetric(vertical: 7),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.5, color: AppColors.gray.withOpacity(0.7))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Container(
                            height: 34,
                            width: 34,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/course-other.png')
                              )
                            )
                          ),
                          SizedBox(height: 1),
                          Text('OTHER', style: TextStyle(fontFamily: AppFonts.bebasNeue))
                        ],),
                      ),
                  ],)
              ],),
            )
          ],)
      ),
    );
  }
}
