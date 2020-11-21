import 'package:flutter/material.dart';
import 'package:flutter_tutofast/screens/profileScreen/studentProfileScreen.dart';
import 'package:flutter_tutofast/screens/profileScreen/teacherProfileScreen.dart';
import 'package:hive/hive.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _sessionbox = Hive.box('session');
    final _isStudent = _sessionbox.get('username') == 'jesus.student';

    return MaterialApp(
      home: _isStudent ? StudentProfileScreen() : TeacherProfileScreen(),
    );
  }
}