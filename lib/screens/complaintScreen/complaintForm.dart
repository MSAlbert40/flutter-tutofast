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

class ComplaintForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height - 54.0;

    return BlocProvider(
      create: (context) => ComplaintFormBloc(),
      child: Builder(builder: (context) {
        final complaintFormBloc = context.bloc<ComplaintFormBloc>();

        return FormBlocListener<ComplaintFormBloc, String, String>(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ 
                Container(
                  width: screenWidth,
                  height: screenHeight / 7.5,
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    borderRadius: BorderRadius.circular(12.0)
                  ),
                  child: Column(children: [SelectTypeComplaint(onPressed: null)])
                ),
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
                SizedBox(height: 25.0),
                MicroButton(
                  width: screenWidth,
                  height: screenHeight / 17.5,
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
        );
      })
    );
  }
}