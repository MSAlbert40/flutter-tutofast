import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_fonts.dart';
import 'package:flutter_tutofast/screens/registerScreen/registerFormBloc.dart';
import 'package:flutter_tutofast/screens/subcriptionScreen/subcriptionData.dart';
import 'package:flutter_tutofast/widgets/buttons/mainButton.dart';

import '../../constants/app_colors.dart';
import '../../widgets/buttons/microButton.dart';

class SubcriptionForm extends StatefulWidget {
  @override
  _SubcriptionFormState createState() => _SubcriptionFormState();
}

class _SubcriptionFormState extends State<SubcriptionForm> {

  SubcriptionData subcriptionData;
  List subcriptions;
  int idSubcriptionSelected;

  @override
  void initState() {
    subcriptionData = SubcriptionData();
    subcriptions = List();
    idSubcriptionSelected = 1;

    loadSubcription();
    super.initState();
  }

  Future loadSubcription() async {
    List result = await subcriptionData.getDataSubcription();
    setState(() {
      subcriptions = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => RegisterFormBloc(),
      child: Builder(builder: (context) {
        // ignore: close_sinks
        final registerFormBloc = context.bloc<RegisterFormBloc>();

        return FormBlocListener<RegisterFormBloc, String, String>(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(children: [
              Container(
                height: ((screenHeight / 1.304) - 50.0) / 1.125,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Container(
                    height: (((screenHeight / 1.304) - 50.0) / 1.125) / 1.09,
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    // color: AppColors.green,
                    child: Column(children: [
                        Container(
                          height: ((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 1.15,
                          // color: AppColors.red,
                          child: Column(children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                for(var item in subcriptions)
                                MicroButton(
                                  onPressed: (){
                                    setState(() {
                                      idSubcriptionSelected = item.id;
                                    });
                                    print(idSubcriptionSelected);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: screenWidth / 1.7,
                                        height: ((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 1.15,
                                        margin: EdgeInsets.only(right: 28.0),
                                        decoration: BoxDecoration(
                                          color: idSubcriptionSelected == item.id ? AppColors.cyan : AppColors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: (((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 1.15) / 1.35,
                                              // color: AppColors.red,
                                              child: Column(children: [
                                                Container(
                                                  width: screenWidth / 1.7,
                                                  height: ((((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 1.15) / 1.35) / 3,
                                                  padding: EdgeInsets.only(right: 15.0, left: 35.0, top: 17.0),
                                                  // color: AppColors.blue,
                                                  child: Column(children: [
                                                    Container(
                                                      width: screenWidth / 1.7,
                                                      alignment: Alignment.centerLeft,
                                                      child: AutoSizeText(
                                                        'Credit',
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                          fontSize: 20.0,
                                                          color: idSubcriptionSelected == item.id ? AppColors.white : AppColors.blue,
                                                          fontFamily: AppFonts.centuryGothic,
                                                          fontWeight: FontWeight.bold,
                                                        )
                                                      )
                                                    ),
                                                    Container(
                                                      width: screenWidth / 1.7,
                                                      alignment: Alignment.bottomLeft,
                                                      child: AutoSizeText(
                                                          item.description,
                                                          maxLines: 3,
                                                          style: TextStyle(
                                                            fontSize: 13.5,
                                                            color: idSubcriptionSelected == item.id ? AppColors.white : AppColors.dark,
                                                            fontFamily: AppFonts.centuryGothic,
                                                          )
                                                        )
                                                      )
                                                    ])
                                                  ),
                                                  Container(
                                                    width: screenWidth / 1.7,
                                                    height: ((((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 1.15) / 1.35) / 3,
                                                    padding: EdgeInsets.only(right: 15.0, left: 35.0, top: 3.0),
                                                    // color: AppColors.green,
                                                    child: Column(children: [
                                                      Container(
                                                        width: screenWidth / 1.7,
                                                        alignment: Alignment.centerLeft,
                                                        child: AutoSizeText(
                                                          'No Ads',
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                            fontSize: 20.0,
                                                            color: idSubcriptionSelected == item.id ? AppColors.white : AppColors.blue,
                                                            fontFamily: AppFonts.centuryGothic,
                                                            fontWeight: FontWeight.bold,
                                                          )
                                                        )
                                                      ),
                                                      Container(
                                                        width: screenWidth / 1.7,
                                                        alignment: Alignment.bottomLeft,
                                                        child: AutoSizeText(
                                                          'Banners and video advertising will be removed.',
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                            fontSize: 13.5,
                                                            color: idSubcriptionSelected == item.id ? AppColors.white : AppColors.dark,
                                                            fontFamily: AppFonts.centuryGothic,
                                                          )
                                                        )
                                                      )
                                                    ])
                                                  ),
                                                ])
                                              ),
                                              Container(
                                                height: (((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 1.15) / 3.9,
                                                // color: AppColors.green,
                                                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                  Container(
                                                    height: (((((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 1.15) / 3.9) - 24) / 1.93,
                                                    alignment: Alignment.bottomLeft,
                                                    child: AutoSizeText(
                                                      item.title,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        fontSize: 46.0,
                                                        color: idSubcriptionSelected == item.id ? AppColors.white : AppColors.blue,
                                                        fontFamily: AppFonts.centuryGothic,
                                                        fontWeight: FontWeight.bold,
                                                        height: 1
                                                      )
                                                    )
                                                  ),
                                                  Container(
                                                    height: (((((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 1.15) / 3.9) - 24) / 4.2,
                                                    alignment: Alignment.topLeft,
                                                    child: AutoSizeText(
                                                      item.period,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: idSubcriptionSelected == item.id ? AppColors.white : AppColors.dark,
                                                        fontFamily: AppFonts.centuryGothic,
                                                        fontWeight: FontWeight.bold,
                                                        height: 1
                                                      )
                                                    )
                                                  ),
                                                  Container(
                                                    height: (((((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 1.15) / 3.9) - 24) / 4.2,
                                                    alignment: Alignment.topLeft,
                                                    child: AutoSizeText(
                                                      'Pay \$' + item.price.toString() + ' per moth',
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        fontSize: 15.5,
                                                        color: idSubcriptionSelected == item.id ? AppColors.white : AppColors.dark,
                                                        fontFamily: AppFonts.centuryGothic,
                                                      )
                                                    )
                                                  )
                                                ])
                                              )
                                          ])
                                      )
                                    ],
                                  ),
                                )
                              ])
                            )
                          ])
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          height: ((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 17,
                          // color: AppColors.blue,
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            'Try out the free trial of 7 days',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.lead.withOpacity(0.7),
                              fontSize: 14.5,
                              letterSpacing: -0.5
                            )
                          )
                        )
                      ])
                  ),
                  Container(
                    height: (((screenHeight / 1.304) - 50.0) / 1.125) / 12.5,
                    // color: AppColors.blue,
                    child: MainButton(
                      child: AutoSizeText('Add Card'),
                      color: AppColors.blue,
                      onPressed: () {
                        //context.bloc<RegisterFormBloc>().submit();
                        subcriptionData.postSubcription(idSubcriptionSelected);
                      }
                    )
                  )
                ])
              )
            ])
          )
        );
      })
    );
  }
}