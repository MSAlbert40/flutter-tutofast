import 'package:get/get.dart';
import 'package:flutter_tutofast/screens/tabs/screen_bloc.dart';

class TabsScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsScreenBloc>(() => TabsScreenBloc());
  }
}
