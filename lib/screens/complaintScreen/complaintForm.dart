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
import 'package:flutter_tutofast/widgets/forms/textInput.dart';

class ComplaintForm extends StatefulWidget {
  @override
  _ComplaintFormState createState() => _ComplaintFormState();
}

class _ComplaintFormState extends State<ComplaintForm> {
  bool viewSelect = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height - 54.0;

    final selectUser = Column(children: [
      SizedBox(height: 25.0),
      Container(
        width: screenWidth,
        height: screenHeight / 8,
        padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
        decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(12.0)
        )
      ),
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
                                    if(index == 0){
                                      viewSelect = true;
                                      print(viewSelect);
                                    }
                                    else{
                                      viewSelect = false;
                                      print(viewSelect);
                                    }
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
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: 'Description',
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12.0),
                                              borderSide: BorderSide(color: AppColors.red)
                                            )
                                          ),
                                          maxLines: 10,
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
                                  viewSelect ? selectUser : Column(),
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