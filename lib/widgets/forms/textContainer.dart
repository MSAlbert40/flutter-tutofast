import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';

class TextContainer extends StatelessWidget {
  final String placeholder;
  final TextInputType keyboardType;
  final TextFieldBloc textFieldBloc;

  const TextContainer({
    Key key, 
    this.placeholder, 
    this.keyboardType = TextInputType.text, 
    this.textFieldBloc
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldBlocBuilder(
      keyboardType: keyboardType,
      textFieldBloc: textFieldBloc,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: TextStyle(
          fontSize: 15.5,
          color: AppColors.lead
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0)
        )
      ),
      maxLines: 10
    );
  }
}