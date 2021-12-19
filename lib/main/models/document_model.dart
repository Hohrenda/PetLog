import 'package:cloud_firestore/cloud_firestore.dart';

class DocumentModel {
  final String? id;
  final String petId;
  final String? documentType;
  final String name;
  final Timestamp date;
  final String? comments;
  final List<String>? imageUrls;

  DocumentModel({
    this.id,
    required this.petId,
    this.documentType,
    required this.name,
    required this.date,
    this.comments,
    this.imageUrls = const [],
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json, String id) {
    return DocumentModel(
      id: id,
      petId: json['petId'],
      documentType: json['documentType'],
      name: json['name'],
      date: json['date'],
      comments: json['comments'],
      imageUrls: List.from(json['imageUrls']),
    );
  }



  Map<String, dynamic> toJson() {
    return {
      'petId': petId,
      'documentType': documentType,
      'name': name,
      'date': date,
      'comments': comments,
      'imageUrls': imageUrls,
    };
  }

  factory DocumentModel.fromDocument(DocumentSnapshot doc) {
    return DocumentModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }

  DocumentModel copyWith({
    String? petId,
    String? documentType,
    String? name,
    Timestamp? date,
    String? comments,
    List<String>? imageUrls,
  }) {
    return DocumentModel(
      petId: petId ?? this.petId,
      documentType: documentType ?? this.documentType,
      name: name ?? this.name,
      date: date ?? this.date,
      comments: comments ?? this.comments,
      imageUrls: imageUrls ?? this.imageUrls,
    );
  }

  @override
  String toString() {
    return '[petId: $petId, documentType: $documentType, name: $name, date: $date, comments: $comments, imageUrls: $imageUrls]';
  }
}
