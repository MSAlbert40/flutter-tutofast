import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_fonts.dart';
import 'package:flutter_tutofast/screens/complaintScreen/complaintFormBloc.dart';
import 'package:flutter_tutofast/screens/complaintScreen/selectTypeComplaint.dart';
import 'package:flutter_tutofast/screens/profileScreen/profileScreen.dart';
import 'package:flutter_tutofast/widgets/buttons/mainButton.dart';
import 'package:flutter_tutofast/widgets/buttons/microButton.dart';
import 'package:flutter_tutofast/widgets/forms/textContainer.dart';
import 'package:flutter_tutofast/widgets/forms/textInput.dart';
import 'package:hive/hive.dart';

class ComplaintForm extends StatefulWidget {
  @override
  _ComplaintFormState createState() => _ComplaintFormState();
}

class _ComplaintFormState extends State<ComplaintForm> {
  Column viewSelect = Column();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height - 54.0;

    final _sessionbox = Hive.box('session');
    final _isRole = _sessionbox.get('role') == 'ROLE_STUDENT';

    final selectUser = Column(children: [
      SizedBox(height: 25.0),
      Stack(children: [
        Container(
          width: screenWidth,
          height: screenHeight / 7.5,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          decoration: BoxDecoration(
            // color: AppColors.blue,
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(
              alignment: Alignment.center,
              fit: BoxFit.cover,
              image: _isRole ? AssetImage('assets/images/backgrounds/BUT.jpg') : AssetImage('assets/images/backgrounds/BUS.jpg')
            )
          )
        ),
        Container(
          width: screenWidth,
          height: screenHeight / 7.5,
          padding: EdgeInsets.only(top: 12.0, bottom: 12.0, left: 20.0),
          decoration: BoxDecoration(
            color: AppColors.dark.withOpacity(0.30),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(children: [
            Container(
              width: (screenWidth - 84.0) / 3.7,
              height: screenHeight / 7.5,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(100.0),
                image: DecorationImage(
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  image: _isRole ? AssetImage('assets/images/backgrounds/IUT.png') : AssetImage('assets/images/backgrounds/IUS.png')
                )
              )
            ),
            Container(
              width: (screenWidth - 84.0) / 1.3,
              height: screenHeight / 7.5,
              // color: AppColors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 5.0),
                  Container(
                    child: AutoSizeText(
                      'Pablo Gabriel',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 17.0,
                        color: AppColors.white,
                        fontFamily: AppFonts.centuryGothic,
                        height: 1
                      )
                    )
                  ),
                  Container(
                    child: AutoSizeText(
                      'Mendez Jimenez',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 35.0,
                        color: AppColors.white,
                        fontFamily: AppFonts.bebasNeue,
                        height: 1.1
                      )
                    )
                  )
              ])
            )
          ])
        ),
      ])
    ]);

    return BlocProvider(
      create: (context) => ComplaintFormBloc(),
      child: Builder(builder: (context) {
        final complaintFormBloc = context.bloc<ComplaintFormBloc>();

        return FormBlocListener<ComplaintFormBloc, String, String>(
          child: Column(children: [
            Stack(children: [
              Container(
                width: screenWidth,
                height: screenHeight,
                // color: AppColors.cyan,
                margin: EdgeInsets.symmetric(horizontal: 22.0),
                child: Column(children: [
                  Container(
                    height: screenHeight / 6,
                    decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0)
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 25.0),
                        Container(
                          width: screenWidth,
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            'Complaint Center',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 45.0,
                              color: AppColors.white,
                              fontFamily: AppFonts.bebasNeue,
                              height: 1
                            )
                          )
                        ),
                        Container(
                          width: screenWidth,
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            'We take care of your problems 24/7',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 14.5,
                              letterSpacing: -0.5,
                              color: AppColors.white,
                              fontFamily: AppFonts.centuryGothic,
                              height: 0.7
                            )
                          )
                        )
                    ])
                  ),
                  Container(
                    height: screenHeight / 29
                  ),
                  Container(
                    height: screenHeight / 1.26,
                    // color: AppColors.green,
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth,
                          child: Column(children: [
                            Container(
                              width: screenWidth,
                              height: screenHeight / 8.5,
                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                              decoration: BoxDecoration(
                                color: AppColors.red,
                                borderRadius: BorderRadius.circular(12.0)
                              ),
                              child: Column(children: [
                                SelectTypeComplaint(
                                  onPressed: (index){
                                    setState(() {
                                      viewSelect = index == 0 ? selectUser : Column();
                                    });
                                  }
                                )
                              ])
                            ),
                            Container(
                              height: screenHeight / 1.48,
                              // color: AppColors.cyan,
                              child: SingleChildScrollView(
                                child: Column(children: [
                                  SizedBox(height: 25.0),
                                  Container(
                                    width: screenWidth,
                                    height: screenHeight / 11,
                                    padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(12.0)
                                    ),
                                    child: TextInput(
                                      placeholder: 'Write your Affair',
                                      keyboardType: TextInputType.emailAddress,
                                      textFieldBloc: complaintFormBloc.reason
                                    ),
                                  ),
                                  SizedBox(height: 25.0),
                                  Container(
                                    width: screenWidth,
                                    height: screenHeight / 4,
                                    padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(12.0)
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                      Container(
                                        height: (screenHeight / 4) / 1.85,
                                        child: TextContainer(
                                          placeholder: 'Decription',
                                          keyboardType: TextInputType.multiline,
                                          textFieldBloc: complaintFormBloc.description
                                        )
                                      ),
                                      Container(
                                        height: (screenHeight / 4) / 11,
                                      ),
                                      Container(
                                        height: (screenHeight / 4) / 6,
                                        child: MainButton(
                                          child: AutoSizeText('Send'),
                                          color: AppColors.cyan,
                                          onPressed: () {
                                            // hideKeyboard(context);
                                            context.bloc<ComplaintFormBloc>().submit();
                                          }
                                        )
                                      )
                                    ])
                                  ),
                                  viewSelect,
                                  SizedBox(height: 25.0),
                                  MicroButton(
                                    width: screenWidth,
                                    height: screenHeight / 18,
                                    alignment: Alignment.center,
                                    color: AppColors.red,
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: AutoSizeText(
                                      'Cancel',
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: AppColors.white,
                                        fontFamily: AppFonts.centuryGothic
                                      )
                                    ),
                                    onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => ProfileScreen()
                                      ));
                                    }
                                  )
                                ])
                              )
                            )
                          ])
                        )
                      ])
                    )
                ])
              )
            ])
          ])
        );
      })
    );
  }
}