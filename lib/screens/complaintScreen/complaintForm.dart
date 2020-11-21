import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_fonts.dart';
import 'package:flutter_tutofast/screens/complaintScreen/complaintFormBloc.dart';
import 'package:flutter_tutofast/widgets/forms/textInput.dart';
import 'package:hive/hive.dart';

class ComplaintForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    final _sessionbox = Hive.box('session');
    final _isStudent = _sessionbox.get('username') == 'jesus.student';

    return BlocProvider(
      create: (context) => ComplaintFormBloc(),
      child:
        Builder( 
          builder: (context) {
            final complaintFormBloc = context.bloc<ComplaintFormBloc>();

            return FormBlocListener<ComplaintFormBloc, String, String>(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: screenHeight / 9,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        decoration: BoxDecoration(
                          color: AppColors.gray,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.7,
                              blurRadius: 0.1,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(                 
                          child: Column(
                            children: [
                              TextInput(
                                placeholder: 'Reason',
                                textFieldBloc: complaintFormBloc.reason
                              ),
                            ],
                          ),
                        )
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: screenHeight / 9,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        decoration: BoxDecoration(
                          color: AppColors.gray,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.7,
                              blurRadius: 0.1,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(                 
                          child: Column(
                            children: [
                              TextInput(
                                placeholder: 'Description',
                                textFieldBloc: complaintFormBloc.description
                              ),
                            ],
                          ),
                        )
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: screenWidth,
                        height: screenHeight/ 9,
                        //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        decoration: BoxDecoration(
                          //color: AppColors.red,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0.7,
                                blurRadius: 0.1,
                                offset: Offset(0, 1),
                              ),
                            ],
                          image: DecorationImage(
                            alignment: Alignment.topRight,
                            fit: BoxFit.none,
                            image: AssetImage(_isStudent ? 
                            'assets/images/backgrounds/BKP.png' :
                            'assets/images/backgrounds/BKD.png')
                          ),
                        ),
                        child: Align(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start, 
                                      children: [
                                        Container(
                                          width: screenWidth/6,
                                          height: screenHeight/12,
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.circular(100.0),
                                            image: DecorationImage(
                                              image: AssetImage(_isStudent ? 
                                              'assets/images/backgrounds/PM.png' :
                                              'assets/images/backgrounds/EM.png'),
                                              alignment: Alignment.center,
                                              fit: BoxFit.fill
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start, 
                                      children: [
                                        Text(_isStudent ? 'Albert' : 'Jesus', 
                                          style: TextStyle(
                                            fontSize: 20, 
                                            fontFamily: AppFonts.centuryGothic,
                                            color: Colors.white
                                          )
                                        ),
                                        Text(_isStudent ? 'Mayta' : 'Duran', 
                                          style: TextStyle(
                                            fontSize: 30, 
                                            fontFamily: AppFonts.bebasNeue,
                                            color: Colors.white
                                          )
                                        ),
                                      ]
                                    ),
                                  ],
                                ),   
                              ],
                            )
                          )
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                      width: screenWidth,
                      height: screenHeight/ 17,
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      decoration: BoxDecoration(
                        color: AppColors.cyan,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.7,
                            blurRadius: 0.1,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: FlatButton(
                        //color: AppColors.red,
                        child: Align(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Send', 
                                  style: TextStyle(
                                    fontSize: 18, 
                                    fontFamily: AppFonts.centuryGothic,
                                    color: Colors.white
                                  )
                                ),
                              ],
                            )
                          )
                        ),
                        onPressed: () {
                          // hideKeyboard(context);
                          context.bloc<ComplaintFormBloc>().submit();
                        }
                      )
                    ),
                      SizedBox(height: 8),
                      Container(
                      width: screenWidth,
                      height: screenHeight/ 17,
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      decoration: BoxDecoration(
                        color: AppColors.lead,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.7,
                            blurRadius: 0.1,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: FlatButton(
                        //color: AppColors.red,
                        child: Align(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Cancel', 
                                  style: TextStyle(
                                    fontSize: 18, 
                                    fontFamily: AppFonts.centuryGothic,
                                    color: Colors.white
                                  )
                                ),
                              ],
                            )
                          )
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }
                      )
                    )
                    ],
                  )
                )
            );
          }  
        )
    );
  }
}