class SubcriptionResultDTO {
  final int id;
  final String title;
  final String period;
  final String description;
  final int hours;
  final double price;

  SubcriptionResultDTO({
    this.id,
    this.title,
    this.period,
    this.description,
    this.hours,
    this.price
  });

  factory SubcriptionResultDTO.fromJson(Map<String, dynamic> json) {
    return SubcriptionResultDTO(
      id: json['id'],
      title: json['title'],
      period: json['period'],
      description: json['description'],
      hours: json['hours'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() => {
      'id': id,
      'title': title,
      'period': period,
      'description': description,
      'hours': hours,
      'price': price,
    };
}