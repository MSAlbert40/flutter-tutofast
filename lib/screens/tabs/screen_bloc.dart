import 'package:get/get.dart';
import 'package:flutter_tutofast/screens/tabs/enums.dart';

class TabsScreenBloc extends GetxController {
  final Rx<TabItem> selectedTabRx = TabItem.home.obs;

  static TabsScreenBloc get to => Get.find();

  void setSelectedTab(TabItem tabItem) {
    selectedTabRx.value = tabItem;
  }
}
