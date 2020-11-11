import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';

class TextInput extends StatelessWidget {
  final String placeholder;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextFieldBloc textFieldBloc;

  const TextInput({
    Key key, 
    this.placeholder, 
    this.obscureText = false, 
    this.keyboardType = TextInputType.text, 
    this.textFieldBloc
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldBlocBuilder(
      keyboardType: keyboardType,
      textFieldBloc: textFieldBloc,
      suffixButton: obscureText ? SuffixButton.obscureText : null,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: TextStyle(
          fontSize: 15.5,
          color: AppColors.lead
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.cyan,
            width: 2.0
          )
        )
      )
    );
  }
}
