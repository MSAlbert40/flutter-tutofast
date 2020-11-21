import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';

class RegisterSelectRole extends StatelessWidget {
  final Function onPressed;

  const RegisterSelectRole({Key key, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final _controller = PageController(initialPage: 0);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: (screenWidth - 60.0) / 6,
            height: ((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 2.6,
            // color: AppColors.red,
            child: FloatingActionButton(
              elevation: 0,
              heroTag: null,
              backgroundColor: AppColors.white,
              child: Icon(Icons.arrow_left_rounded, color: AppColors.blue, size: 50.0),
              onPressed: (){
                _controller.jumpToPage(0);
              }
            )
          ),
          Container(
            width: (screenWidth - 60.0) / 1.9,
            height: ((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 2.6,
            // color: AppColors.blue,
            child: PageView(
              controller: _controller,
              onPageChanged: onPressed,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: (((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 2.6) / 1.25,
                      decoration: const BoxDecoration(
                        // color: AppColors.cyan,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('assets/images/objects/UStudent.png')
                        )
                      )
                    ),
                    Container(
                      height: (((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 2.6) / 5.0,
                      // color: AppColors.red,
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        'Student',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 22.0,
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold
                        )
                      )
                    )
                ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: (((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 2.6) / 1.25,
                      decoration: const BoxDecoration(
                        // color: AppColors.cyan,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('assets/images/objects/UTeacher.png')
                        )
                      )
                    ),
                    Container(
                      height: (((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 2.6) / 5.0,
                      // color: AppColors.red,
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        'Teacher',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 22.0,
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold
                        )
                      )
                    )
                ])
              ]
            )
          ),
          Container(
            width: (screenWidth - 60.0) / 6,
            height: ((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 2.6,
            // color: AppColors.cyan,
            child: FloatingActionButton(
              elevation: 0,
              heroTag: null,
              backgroundColor: AppColors.white,
              child: Icon(Icons.arrow_right_rounded, color: AppColors.blue, size: 50.0),
              onPressed: (){
                _controller.jumpToPage(1);
              }
            )
          )
      ])
    );
  }
}