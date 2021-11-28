import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String? userId;
  final String? userName;
  final String? email;

  UserProfile({
    this.userId,
    this.userName,
    this.email,
  });

  @override
  String toString(){
    return '[userId: $userId, userName: $userName, email: $email]';
  }

  Map<String, Object?> toJson() {
    return {
      'userName': userName,
      'email': email,
    };
  }

  factory UserProfile.fromJson(Map<String, dynamic> doc, String userId) {
    UserProfile user = UserProfile(
      userId: userId,
      userName: doc['userName'],
      email: doc['email'],
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
  }) {
    return UserProfile(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      email: email ?? this.email,
    );
  }
}
