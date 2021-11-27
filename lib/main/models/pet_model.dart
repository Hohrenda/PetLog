class PetModel {
  final String name;
  final String type;
  final String? gender;
  final String? breed;
  final DateTime date;
  final String? color;
  final String? comments;

  const PetModel({
    required this.name,
    required this.type,
    required this.date,
    this.gender,
    this.breed,
    this.color,
    this.comments,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      name: json['name'],
      type: json['type'],
      date: json['date'],
      gender: json['gender'],
      breed: json['breed'],
      color: json['color'],
      comments: json['comments'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'date': date,
      'gender': gender,
      'breed': breed,
      'color': color,
      'comments': comments,
    };
  }
}
