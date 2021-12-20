import 'package:cloud_firestore/cloud_firestore.dart';

class DocumentModel {
  final String? id;
  final String petId;
  final String? documentType;
  final String name;
  final Timestamp date;
  final String? comments;
  final List<String>? fileUrls;

  DocumentModel({
    this.id,
    required this.petId,
    this.documentType,
    required this.name,
    required this.date,
    this.comments,
    this.fileUrls = const [],
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json, String id) {
    return DocumentModel(
      id: id,
      petId: json['petId'],
      documentType: json['documentType'],
      name: json['name'],
      date: json['date'],
      comments: json['comments'],
      fileUrls: List.from(json['fileUrls']),
    );
  }



  Map<String, dynamic> toJson() {
    return {
      'petId': petId,
      'documentType': documentType,
      'name': name,
      'date': date,
      'comments': comments,
      'fileUrls': fileUrls,
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
    List<String>? fileUrls,
  }) {
    return DocumentModel(
      petId: petId ?? this.petId,
      documentType: documentType ?? this.documentType,
      name: name ?? this.name,
      date: date ?? this.date,
      comments: comments ?? this.comments,
      fileUrls: fileUrls ?? this.fileUrls,
    );
  }

  @override
  String toString() {
    return '[petId: $petId, documentType: $documentType, name: $name, date: $date, comments: $comments, fileUrls: $fileUrls]';
  }
}
