import 'package:flutter/material.dart';
import 'package:flutter_tutofast/screens/reviewScreen/reviewForm.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReviewForm(),
    );
  }
}
