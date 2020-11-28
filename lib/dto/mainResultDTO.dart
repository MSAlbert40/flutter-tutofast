import 'package:flutter_tutofast/dto/coursesResultDTO.dart';
import 'package:flutter_tutofast/dto/profileResultDTO.dart';

class MainResultDTO {
  final int id;
  final String topic;
  final ProfileResultDTO student;
  final CoursesResultDTO course;

  MainResultDTO({
    this.id,
    this.topic,
    this.student,
    this.course
  });

  factory MainResultDTO.fromJson(Map<String, dynamic> json) {
    return MainResultDTO(
      id: json['id'],
      topic: json['topic'],
      student: ProfileResultDTO.fromJson(json['student']),
      course: CoursesResultDTO.fromJson(json['course'])
    );
  }

  Map<String, dynamic> toJson() => {
      'id': id,
      'topic': topic,
      'student': student,
      'course': course
  };
}
