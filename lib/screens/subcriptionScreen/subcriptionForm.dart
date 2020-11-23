import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
import 'package:flutter_tutofast/screens/registerScreen/registerFormBloc.dart';
import 'package:flutter_tutofast/widgets/buttons/mainButton.dart';

class SubcriptionForm extends StatelessWidget {
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
                          olor: AppColors.red,
                          child: Column(children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: [
                                // Aquí se debe incuir un listView con las subcripciones
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