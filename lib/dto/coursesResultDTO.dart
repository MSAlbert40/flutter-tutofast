class CoursesResultDTO {
  final int id;
  final String name;
  final String description;

  CoursesResultDTO({
    this.id, 
    this.name, 
    this.description
  });

  factory CoursesResultDTO.fromJson(Map<String, dynamic> json){
    return CoursesResultDTO(
      id: json['id'],
      name: json['name'],
      description: json['description']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description
  };
}
