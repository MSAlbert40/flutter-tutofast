import 'package:flutter/material.dart';
import 'package:flutter_tutofast/screens/profileScreen/profileScreen.dart';
import 'package:get/get.dart';
import 'package:flutter_tutofast/constants/app_navigators.dart';
import 'package:flutter_tutofast/constants/app_routes.dart';

class TabsScreenTabProfile extends StatelessWidget {
  const TabsScreenTabProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(AppNavigators.profile),
      initialRoute: AppRoutes.profile,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.profile:
          default:
            return GetPageRoute(
                settings: settings, page: () => const ProfileScreen());
        }
      },
    );
  }
}