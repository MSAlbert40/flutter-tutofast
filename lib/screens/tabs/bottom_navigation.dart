import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_sizes.dart';
import 'package:flutter_tutofast/screens/tabs/bottom_navigation_tab.dart';
import 'package:flutter_tutofast/screens/tabs/enums.dart';
import 'package:flutter_tutofast/screens/tabs/screen_bloc.dart';

class TabsScreenBottomNavigation extends StatelessWidget {
  const TabsScreenBottomNavigation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenBloc = TabsScreenBloc.to;
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalSpacing),
      color: AppColors.white,
      child: Obx(() {
        final _selectedTab = _screenBloc.selectedTabRx.value;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TabsScreenBottomNavigationTab(
                label: 'Inicio',
                icon: Icons.home,
                isActive: _selectedTab == TabItem.home,
                onTap: () {
                  _screenBloc.setSelectedTab(TabItem.home);
                }),
            TabsScreenBottomNavigationTab(
                label: 'Horario',
                icon: Icons.grid_on,
                isActive: _selectedTab == TabItem.schedule,
                onTap: () {
                  _screenBloc.setSelectedTab(TabItem.schedule);
                }),
            TabsScreenBottomNavigationTab(
                label: 'Perfil',
                icon: Icons.person,
                isActive: _selectedTab == TabItem.profile,
                onTap: () {
                  _screenBloc.setSelectedTab(TabItem.profile);
                }),
          ],
        );
      }),
    );
  }
}
