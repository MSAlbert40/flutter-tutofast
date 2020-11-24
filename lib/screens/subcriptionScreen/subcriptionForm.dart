import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/constants/app_fonts.dart';
import 'package:flutter_tutofast/screens/registerScreen/registerFormBloc.dart';
import 'package:flutter_tutofast/screens/subcriptionScreen/subcriptionData.dart';
import 'package:flutter_tutofast/widgets/buttons/mainButton.dart';

class SubcriptionForm extends StatefulWidget {
  @override
  _SubcriptionFormState createState() => _SubcriptionFormState();
}

class _SubcriptionFormState extends State<SubcriptionForm> {

  SubcriptionData subcriptionData;
  List subcriptions;

  @override
  void initState() {
    subcriptionData = SubcriptionData();
    subcriptions = List();

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
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Container(
                          height: ((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 1.15,
                          // color: AppColors.red,
                          child: Column(children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: [
                                for(var item in  subcriptions) (


                                  Container(
                                    width: 180,
                                    margin: EdgeInsets.only(right: 20),
                                    height: ((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 1.15,
                                    decoration: BoxDecoration(color: AppColors.cyan, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Credit",
                                            style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: AppFonts.centuryGothic, fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            item.description,
                                            style: TextStyle(fontSize: 10, color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "No Ads",
                                            style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: AppFonts.centuryGothic, fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Banners and video adversiting will be removed.",
                                            style: TextStyle(fontSize: 10, color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            item.title,
                                            style: TextStyle(fontSize: 32, color: Colors.white, fontFamily: AppFonts.centuryGothic, fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            item.period,
                                            style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: AppFonts.centuryGothic, fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "\$" + item.price.toString(),
                                            style: TextStyle(fontSize: 10, color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )


                                )                            
                              ])
                            )
                          ])
                        ),
                        Container(
                          height: ((((screenHeight / 1.304) - 50.0) / 1.125) / 1.09) / 14,
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
                    )
                  ),
                  Container(
                    height: (((screenHeight / 1.304) - 50.0) / 1.125) / 12.5,
                    // color: AppColors.blue,
                    child: MainButton(
                      child: AutoSizeText('Add Card'),
                      color: AppColors.blue,
                      onPressed: () {
                        context.bloc<RegisterFormBloc>().submit();
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