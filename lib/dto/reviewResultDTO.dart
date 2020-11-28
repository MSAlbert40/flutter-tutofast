import 'package:flutter_tutofast/dto/profileResultDTO.dart';

class ReviewResultDTO {
  final int id;
  final String description;
  final int stars;
  final ProfileResultDTO student;

  ReviewResultDTO({
    this.id,
    this.description,
    this.stars,
    this.student,
  });

  factory ReviewResultDTO.fromJson(Map<String, dynamic> json) {
    return ReviewResultDTO(
      id: json['id'],
      description: json['description'],
      stars: json['stars'],
      student: ProfileResultDTO.fromJson(json['student'])
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'description': description,
    'stars': stars,
    'student': student
  };

}