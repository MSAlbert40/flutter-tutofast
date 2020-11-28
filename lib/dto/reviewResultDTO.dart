class ReviewResultDTO {
  final int id;
  final String description;
  final int stars;

  ReviewResultDTO({
    this.id,
    this.description,
    this.stars,
  });

  factory ReviewResultDTO.fromjson(Map<String, dynamic> json) {
    return ReviewResultDTO(
      id: json['id'],
      description: json['description'],
      stars: json['stars']
    );
  }
}