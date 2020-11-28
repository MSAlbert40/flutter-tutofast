import 'package:flutter/material.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_fonts.dart';
import 'package:flutter_tutofast/screens/loginScreen/loginScreen.dart';
import 'package:flutter_tutofast/screens/registerScreen/registerScreen.dart';
import 'package:flutter_tutofast/screens/subcriptionScreen/subcriptionScreen.dart';
import 'package:flutter_tutofast/screens/tabs/screen.dart';
import 'package:flutter_tutofast/screens/tabs/screen_bindings.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'constants/app_routes.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: GetMaterialApp(
        title: 'TutoFast',
        home: const LoginScreen(),
        themeMode: ThemeMode.system,
        theme: ThemeData(
          fontFamily: AppFonts.centuryGothic,
          primaryColor: AppColors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: AppColors.white,
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
            color: AppColors.white,
            iconTheme: Theme.of(context).iconTheme.copyWith(
              color: AppColors.dark, 
              size: 10
            ),
            textTheme: Theme.of(context).textTheme.copyWith(
              headline6: Theme.of(context).textTheme.bodyText2.copyWith(
                color: AppColors.dark,
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
            )
          )
        ),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case AppRoutes.register:
              return GetPageRoute(
                  settings: settings,
                  page: () => const RegisterScreen());
            case AppRoutes.subscription:
              return GetPageRoute(
                  settings: settings,
                  page: () => const SubcriptionScreen());
            case AppRoutes.tabs:
              return GetPageRoute(
                  binding: TabsScreenBindings(),
                  settings: settings,
                  page: () => const TabsScreen());
            default:
              return GetPageRoute(
                settings: settings, page: () => const LoginScreen());
          }
        },
      )
    );
  }
}
