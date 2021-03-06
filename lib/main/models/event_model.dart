import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String? id;
  final String? petId;
  final String svgIcon;
  final String name;
  final Timestamp date;

  EventModel({
    this.id,
    required this.petId,
    required this.svgIcon,
    required this.name,
    required this.date,
  });

  factory EventModel.fromJson(Map<String, dynamic> json, String id,) {
    return EventModel(
        id: id,
        petId: json['petId'],
        svgIcon: json['svgIcon'],
        name: json['name'],
        date: json['date']);
  }

  Map<String, dynamic> toJson() {
    return {
      'petId':petId,
      'svgIcon': svgIcon,
      'name': name,
      'date': date,
    };
  }

  factory EventModel.fromDocument(DocumentSnapshot doc) {
    return EventModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }

  EventModel copyWith({
    String? id,
    String? petId,
    String? svgIcon,
    String? name,
    Timestamp? date,
  }) {
    return EventModel(
      id: id ?? this.id,
      svgIcon: svgIcon ?? this.svgIcon,
      name: name ?? this.name,
      date: date ?? this.date,
      petId: petId ?? this.petId,
    );
  }

  @override
  String toString() {
    return '[id: $id, name: $name, date: $date, svgIcon: $svgIcon, petId: $petId]';
  }
}
