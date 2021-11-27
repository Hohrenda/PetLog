import 'package:cloud_firestore/cloud_firestore.dart';

class PetModel {
  final String? id;
  final String ownerId;
  final String name;
  final String? imgUrl;
  final String type;
  final String? gender;
  final String? breed;
  final Timestamp date;
  final String? color;
  final String? comments;

  const PetModel({
    this.id,
    required this.ownerId,
    required this.name,
    required this.type,
    required this.date,
    this.gender,
    this.imgUrl,
    this.breed,
    this.color,
    this.comments,
  });

  factory PetModel.fromJson(Map<String, dynamic> json, String id) {
    return PetModel(
      id: id,
      ownerId: json['ownerId'],
      name: json['name'],
      imgUrl: json['imgUrl'],
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
      'ownerId': ownerId,
      'name': name,
      'imgUrl': imgUrl,
      'type': type,
      'date': date,
      'gender': gender,
      'breed': breed,
      'color': color,
      'comments': comments,
    };
  }

  factory PetModel.fromDocument(DocumentSnapshot doc) {
    return PetModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }

  PetModel copyWith({
    String? id,
    String? ownerId,
    String? imgUrl,
    String? name,
    String? type,
    String? gender,
    String? breed,
    Timestamp? date,
    String? color,
    String? comments,
  }) {
    return PetModel(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      breed: breed ?? this.breed,
      date: date ?? this.date,
      color: color ?? this.color,
      comments: comments ?? this.comments,
    );
  }
}
