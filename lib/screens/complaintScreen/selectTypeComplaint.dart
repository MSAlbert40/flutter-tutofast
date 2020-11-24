import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_fonts.dart';

class SelectTypeComplaint extends StatelessWidget {
  final Function onPressed;

  const SelectTypeComplaint({Key key, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height - 54.0;
    final _controller = PageController(initialPage: 0);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: (screenWidth - 64.0) / 8,
            height: (screenHeight / 8.5) - 30.0,
            // color: AppColors.blue,
            child: FloatingActionButton(
              elevation: 0,
              heroTag: null,
              backgroundColor: AppColors.red,
              child: Icon(Icons.arrow_left_rounded, color: AppColors.white, size: 50.0),
              onPressed: (){
                _controller.jumpToPage(0);
              }
            )
          ),
          Container(
            width: (screenWidth - 64.0) / 1.34,
            height: (screenHeight / 8.5) - 30.0,
            // color: AppColors.green,
            child: PageView(
              controller: _controller,
              onPageChanged: onPressed,
              children: [
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: ((screenWidth - 64.0) / 1.34) / 3,
                        height: (screenHeight / 8.5) - 30.0,
                        child: Column(children: [
                          Container(
                            width: (((screenWidth - 64.0) / 1.34) / 3) - 20.0,
                            height: (screenHeight / 8.5) - 30.0,
                            decoration: const BoxDecoration(
                              // color: AppColors.cyan,
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage('assets/images/icons/SD1.png')
                              )
                            )
                          )
                        ])
                      ),
                      Container(
                        width: ((screenWidth - 64.0) / 1.34) / 1.5,
                        height: (screenHeight / 8.5) - 30.0,
                        // color: AppColors.cyan,
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                'Session Problems',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 29.0,
                                  color: AppColors.white,
                                  fontFamily: AppFonts.bebasNeue
                                )
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                'Report your problems',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  height: 0.6,
                                  color: AppColors.white,
                                  fontFamily: AppFonts.centuryGothic
                                )
                              )
                            )
                        ])
                      )
                  ])
                ]),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: ((screenWidth - 64.0) / 1.34) / 3,
                        height: (screenHeight / 8.5) - 30.0,
                        child: Column(children: [
                          Container(
                            width: (((screenWidth - 64.0) / 1.34) / 3) - 15.0,
                            height: (screenHeight / 8.5) - 30.0,
                            decoration: const BoxDecoration(
                              // color: AppColors.cyan,
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage('assets/images/icons/OL.png')
                              )
                            )
                          )
                        ])
                      ),
                      Container(
                        width: ((screenWidth - 64.0) / 1.34) / 1.5,
                        height: (screenHeight / 8.5) - 30.0,
                        // color: AppColors.cyan,
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                'TutoFast Problems',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 29.0,
                                  color: AppColors.white,
                                  fontFamily: AppFonts.bebasNeue
                                )
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                'Report your problems',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  height: 0.6,
                                  color: AppColors.white,
                                  fontFamily: AppFonts.centuryGothic
                                )
                              )
                            )
                        ])
                      )
                  ])
                ])
              ],
            ),
          ),
          Container(
            width: (screenWidth - 64.0) / 8,
            height: (screenHeight / 8.5) - 30.0,
            // color: AppColors.cyan,
            child: FloatingActionButton(
              elevation: 0,
              heroTag: null,
              backgroundColor: AppColors.red,
              child: Icon(Icons.arrow_right_rounded, color: AppColors.white, size: 50.0),
              onPressed: (){
                _controller.jumpToPage(1);
              }
            )
          )
      ])
    );
  }
}
