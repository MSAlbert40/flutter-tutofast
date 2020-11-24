import 'package:flutter/material.dart';
import 'package:flutter_tutofast/screens/complaintScreen/complaintForm.dart';

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [ComplaintForm()])
      )
    );
  }
}