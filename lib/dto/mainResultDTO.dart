class MainResultDTO {
  final int id;
  final String topic;

  MainResultDTO({
    this.id, 
    this.topic, 
  });

  factory MainResultDTO.fromJson(Map<String, dynamic> json) {
    return MainResultDTO(
      id: json['id'],
      topic: json['topic'],
    );
  }

  Map<String, dynamic> toJson() => {
      'id': id,
      'topic': topic,
    };
}
