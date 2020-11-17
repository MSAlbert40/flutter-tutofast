import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tutofast/constants/app_navigators.dart';
import 'package:flutter_tutofast/constants/app_routes.dart';
import 'package:flutter_tutofast/screens/mainScreen/mainScreen.dart';

class TabsScreenTabMain extends StatelessWidget {
  const TabsScreenTabMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(AppNavigators.main),
      initialRoute: AppRoutes.main,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.main:
          default:
            return GetPageRoute(
                settings: settings, page: () => const MainScreen());
        }
      },
    );
  }
}
