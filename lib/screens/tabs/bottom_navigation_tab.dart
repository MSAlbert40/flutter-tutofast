import 'package:flutter/material.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_sizes.dart';

class TabsScreenBottomNavigationTab extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool isActive;
  const TabsScreenBottomNavigationTab({
    Key key,
    this.label,
    this.icon,
    this.onTap,
    this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _inactiveTextStyle = Theme.of(context).textTheme.bodyText2;
    final _activeTextStyle =
        _inactiveTextStyle.copyWith(color: AppColors.white);
    const _commonDuration = Duration(milliseconds: 200);
    final _availableSpace =
        MediaQuery.of(context).size.width - AppSizes.horizontalSpacing * 2;
    final _inactiveWidth = _availableSpace * .2;
    final _activeWidth = _availableSpace * .35;

    return AnimatedContainer(
      duration: _commonDuration,
      width: isActive ? _activeWidth : _inactiveWidth,
      height: 35,
      child: Material(
        color: Colors.transparent,
        shape: const StadiumBorder(),
        clipBehavior: Clip.antiAlias,
        child: AnimatedContainer(
          duration: _commonDuration,
          decoration: BoxDecoration(color: isActive ? Theme.of(context).primaryColor : null),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: AnimatedDefaultTextStyle(
                style: isActive ? _activeTextStyle : _inactiveTextStyle,
                duration: _commonDuration,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 20,
                      color: isActive ? AppColors.white : AppColors.dark,
                    ),
                    if (isActive)
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        child: Text(label),
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
