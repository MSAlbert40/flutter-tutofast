import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_fonts.dart';
import 'package:flutter_tutofast/screens/mainScreen/mainFormBloc.dart';
import 'package:flutter_tutofast/widgets/buttons/microButton.dart';
import 'package:hive/hive.dart';

class MainForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height - 60.0;

    final _sessionbox = Hive.box('session');
    final _isRole = _sessionbox.get('role') == 'ROLE_STUDENT';

    return BlocProvider(
      create: (context) => MainFormBloc(),
      child: Builder(builder: (context) {
        final mainFormBloc = context.bloc<MainFormBloc>();

        return FormBlocListener<MainFormBloc, String, String>(
          child: Column(children: [
            SizedBox(height: 25.0),
            Container(
              width: screenWidth,
              height: screenHeight / 3.4,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.0)
              ),
              child: Column(children: [
                MicroButton(
                  height: ((screenHeight / 3.4) - 30.0) / 5,
                  width: screenWidth - 30.0,
                  color: _isRole ? AppColors.cyan : AppColors.blue,
                  borderRadius: BorderRadius.circular(12.0),
                  child: AutoSizeText(
                    _isRole ? 'Reserve' : 'Search',
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: AppColors.white,
                      fontFamily: AppFonts.centuryGothic
                    )
                  ),
                ),
                Container(
                  height: ((screenHeight / 3.4) - 30.0) / 11,
                ),
                Container(
                  height: ((screenHeight / 3.4) - 30.0) / 1.42,
                  color: AppColors.cyan
                )
              ])
            ),
            SizedBox(height: 25.0),
            Container(
              width: screenWidth,
              height: screenHeight / 6.3,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.0)
              ),
            ),
          ])
        );
      })
    );
  }
}