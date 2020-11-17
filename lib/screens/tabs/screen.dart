import 'package:flutter/material.dart';
import 'package:flutter_tutofast/screens/tabs/body.dart';
import 'package:flutter_tutofast/screens/tabs/bottom_navigation.dart';
import 'package:flutter_tutofast/screens/tabs/enums.dart';
import 'package:flutter_tutofast/screens/tabs/screen_bloc.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenBloc = TabsScreenBloc.to;
    return WillPopScope(
      onWillPop: () async {
        if (_screenBloc.selectedTabRx.value != TabItem.home) {
          _screenBloc.setSelectedTab(TabItem.home);
        }
        return false;
      },
      child: const Scaffold(
        bottomNavigationBar: TabsScreenBottomNavigation(),
        body: TabsScreenBody(),
      ),
    );
  }
}
