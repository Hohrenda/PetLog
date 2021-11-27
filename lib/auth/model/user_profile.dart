import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String? userId;
  final String? userName;
  final String? email;
  final List<String>? pets;

  UserProfile({
    this.userId,
    this.userName,
    this.email,
    this.pets,
  });

  Map<String, Object?> toJson() {
    return {
      'userName': userName,
      'email': email,
      'pets': pets,
    };
  }

  factory UserProfile.fromJson(Map<String, dynamic> doc, String userId) {
    UserProfile user = UserProfile(
      userId: userId,
      userName: doc['userName'],
      email: doc['email'],
      pets: doc['pets'],
    );
    return user;
  }

  factory UserProfile.fromDocument(DocumentSnapshot doc) {
    return UserProfile.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }

  UserProfile copyWith({
    String? userId,
    String? userName,
    String? email,
    List<String>? pets,
  }) {
    return UserProfile(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      pets: pets ?? this.pets,
    );
  }
}
