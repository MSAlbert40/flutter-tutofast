import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_routes.dart';
import 'package:flutter_tutofast/widgets/buttons/microButton.dart';
import 'package:get/get.dart';

class RegisterTopBanner extends StatelessWidget {
  final Widget child;

  const RegisterTopBanner({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bannerHeight = screenHeight / 3.5;
    final microButtonHeight = ((screenHeight / 4.3) / 2.7) / 2;

    return Column(children: [
      Stack(children: [
        Container(
          width: screenWidth,
          height: bannerHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/backgrounds/BT.jpg')
            )
          )
        ),
        Container(
          width: screenWidth,
          height: bannerHeight,
          color: AppColors.blue.withOpacity(0.55),
        ),
        Column(children: [
          Container(
            height: bannerHeight - microButtonHeight - 25,
            child: Column(children: [
              Container(
                width: 70.0,
                height: 70.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/icons/OL.png')
                  )
                )
              ),
            ])
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MicroButton(
                      width: screenWidth / 2.3,
                      height: microButtonHeight,
                      alignment: Alignment.center,
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)
                      ),
                      onPressed: () {
                        Get.toNamed(AppRoutes.login);
                      },
                      child: AutoSizeText(
                        'Sign In',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold
                        )
                      )
                    ),
                    MicroButton(
                      width: screenWidth / 2.3,
                      height: microButtonHeight,
                      alignment: Alignment.center,
                      color: AppColors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)
                      ),
                      onPressed: () {
                        Get.toNamed(AppRoutes.register);
                      },
                      child: AutoSizeText(
                        'Register',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold
                        )
                      )
                    )
                  ]
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.white),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)
                    )
                  ),
                  child: child,
                ),
              ]
            )
          ),
        ])
      ]),
    ]);
  }
}