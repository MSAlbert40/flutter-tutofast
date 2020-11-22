import 'package:flutter/material.dart';
import 'package:flutter_tutofast/screens/tabs/tab_profile.dart';
import 'package:get/get.dart';
import 'package:flutter_tutofast/screens/tabs/screen_bloc.dart';
import 'package:flutter_tutofast/screens/tabs/tab_main.dart';

class TabsScreenBody extends StatelessWidget {
  const TabsScreenBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenBloc = TabsScreenBloc.to;
    return Obx(() => IndexedStack(
      index: _screenBloc.selectedTabRx.value.index,
      children: const [
        TabsScreenTabMain(),
        Scaffold(),
        TabsScreenTabProfile(),
      ],
    ));
  }
}
