import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class MainFormBloc extends FormBloc<String, String> {
  // ignore: close_sinks
  final time = TextFieldBloc(
    name: 'time',
    initialValue: ''
  );
  // ignore: close_sinks
  final date = TextFieldBloc(
    name: 'date',
    initialValue: ''
  );
  // ignore: close_sinks
  final topic = TextFieldBloc(
    name: 'topic',
    initialValue: ''
  );

  MainFormBloc() {
    addFieldBlocs(fieldBlocs: [
      time, date, topic
    ]);
  }

  @override
  void onSubmitting() async {}
}