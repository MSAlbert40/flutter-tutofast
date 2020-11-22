import 'package:flutter/material.dart';
import 'package:flutter_tutofast/screens/profileScreen/profileForm.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileForm()
    );
  }
}
