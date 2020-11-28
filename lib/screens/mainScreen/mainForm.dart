import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_fonts.dart';
import 'package:flutter_tutofast/dto/profileResultDTO.dart';
import 'package:flutter_tutofast/screens/mainScreen/mainFormBloc.dart';
import 'package:flutter_tutofast/screens/profileScreen/profileData.dart';
import 'package:flutter_tutofast/widgets/buttons/microButton.dart';
import 'package:hive/hive.dart';

class MainForm extends StatefulWidget {
  @override
  _MainFormState createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  ProfileData profileData;
  ProfileResultDTO profile;
  List courses;
  int idCourseSelect;

  @override
  void initState() {
    profileData = ProfileData();
    profile = ProfileResultDTO();
    courses = List();
    idCourseSelect = 1;

    loadCourses();
    super.initState();
  }

  Future loadCourses() async {
    ProfileResultDTO result = await profileData.getDataProfile();
    setState(() {
      profile = result;
    });    

    List view = await profileData.getDataCourses();
    setState(() {
      courses = view;
    });    
  }

  String selectImageCourse(String courseName) {

    String image = '';

    switch(courseName) {
      case 'Spanish':
        image = 'E0.png';
        break;
      case 'History':
        image = 'H0.png';
      break;
      case 'Arithmetics':
        image = 'AR0.png';
      break;
      case 'Geometry':
        image = 'G0.png';
      break;
      case 'Geography':
        image = 'GF0.png';
      break;
      case 'Algebra':
        image = 'AR0.png';
      break;
      case 'Chemistry':
        image = 'Q0.png';
      break;
      case 'Physics':
        image = 'F0.png';
      break;
      case 'Biology':
        image = 'B0.png';
      break;
    }

    return image;
  }

  String selectImage(String courseName) {

    String image = '';

    switch(courseName) {
      case 'Spanish':
        image = 'E1.png';
        break;
      case 'History':
        image = 'H1.png';
      break;
      case 'Arithmetics':
        image = 'AR1.png';
      break;
      case 'Geometry':
        image = 'G1.png';
      break;
      case 'Geography':
        image = 'GF1.png';
      break;
      case 'Algebra':
        image = 'AR1.png';
      break;
      case 'Chemistry':
        image = 'Q1.png';
      break;
      case 'Physics':
        image = 'F1.png';
      break;
      case 'Biology':
        image = 'B1.png';
      break;
    }

    return image;
  }


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
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.silver,
                    blurRadius: 7,
                    offset: Offset(0, 3)
                  )
                ]
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/backgrounds/SH.png')
                    )
                  )
                )
              ])
            ),
            SizedBox(height: 25.0),
            Container(
              width: screenWidth,
              height: screenHeight / 5.8,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.silver,
                    blurRadius: 7,
                    offset: Offset(0, 3)
                  )
                ]
              ),
              child: Column(children: [
                Container(
                  width: screenWidth,
                  height: ((screenHeight / 5.8) - 30.0) / 5,
                  child: Row(children: [
                    Container(
                      child: AutoSizeText(
                        'Choose the ', 
                        style: TextStyle(
                          fontFamily: AppFonts.centuryGothic, 
                          fontWeight: FontWeight.normal,
                          fontSize: 14.5
                        )
                      )
                    ),
                    Container(
                      child: AutoSizeText(
                        'Course', 
                        maxLines: 1,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor, 
                          fontSize: 16.0, 
                          fontFamily: AppFonts.centuryGothic, 
                          fontWeight: FontWeight.bold
                        )
                      )
                    )
                  ])
                ),
                Container(
                  width: screenWidth,
                  height: ((screenHeight / 5.8) - 30.0) / 1.2,
                  // color: AppColors.cyan,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      for(var course in courses)
                      MicroButton(
                        onPressed: (){
                          setState(() {
                            idCourseSelect = course.id;
                          });
                          print(idCourseSelect);
                        },
                        child: Container(
                          width: screenWidth / 5,
                          height: ((screenHeight / 5.8) - 30.0) / 1.2,
                          margin: EdgeInsets.only(right: 20.0, top: 5.0),
                          decoration: BoxDecoration(
                            color: idCourseSelect == course.id ? Theme.of(context).primaryColor : AppColors.white,
                            borderRadius: BorderRadius.all(Radius.circular(7.5)),
                            border: Border.all(
                              color: AppColors.silver,
                              width: 1
                            )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: screenWidth / 5,
                                height: (((screenHeight / 5.8) - 30.0) / 1.2) / 1.8,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    alignment: Alignment.center,
                                    fit: BoxFit.contain,
                                    image: idCourseSelect == course.id ? AssetImage('assets/images/icons/' + selectImage(course.name)) : AssetImage('assets/images/icons/' + selectImageCourse(course.name))
                                  )
                                )
                              ),
                              Container(
                                width: screenWidth / 5,
                                height: (((screenHeight / 5.8) - 30.0) / 1.2) / 3.7,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                // color: AppColors.blue,
                                child: AutoSizeText(
                                  course.name,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontFamily: AppFonts.bebasNeue,
                                      color: idCourseSelect == course.id ? AppColors.white : AppColors.dark,
                                    )
                                )
                              )
                          ])
                        )
                      )
                    ])
                  )
                )
              ])
            ),
          ])
        );
      })
    );
  }
}