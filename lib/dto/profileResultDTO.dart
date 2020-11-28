import 'package:flutter_tutofast/dto/subcriptionResultDTO.dart';

class ProfileResultDTO {
  final int id;
  final String name;
  final String lastName;
  final String dni;
  final String email;
  final String birthday;
  final String address;
  final int creditHours;
  final double averageStars;
  final List courses;
  final SubcriptionResultDTO plan;

  ProfileResultDTO({
      this.id,
      this.name,
      this.lastName,
      this.dni,
      this.email,
      this.birthday,
      this.address,
      this.creditHours,
      this.averageStars,
      this.courses,
      this.plan
  });

  factory ProfileResultDTO.fromJson(Map<String, dynamic> json) {
    return ProfileResultDTO(
      id: json['id'],
      name: json['name'],
      lastName: json['lastName'],
      dni: json['dni'],
      email: json['email'],
      birthday: json['birthday'],
      address: json['address'],
      creditHours: json['creditHours'],
      averageStars: json['averageStars'],
      courses: json['courses'],
      plan: SubcriptionResultDTO.fromJson(json['plan'])
    );
  }
}