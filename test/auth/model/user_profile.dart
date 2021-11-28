import 'package:flutter_test/flutter_test.dart';
import 'package:pet_log/auth/model/user_profile.dart';

void main() {
  group("UserProfile", () {
    const String userId = 'id';
    const String userName = 'testName';
    const String email = 'test@email.com';

    test(".fromJson() returns an instance of UserProfile", () {
      final json = {'userName': userName, 'email': email};

      final UserProfile userProfile = UserProfile.fromJson(json, userId);

      final UserProfile expectedProfile = UserProfile(
        userId: userId,
        userName: userName,
        email: email,
      );

      expect(userProfile.toString(), equals(expectedProfile.toString()));
    });

    test(".toJson() returns an instance Map<String, dynamic> with user data",
        () {
      final expectedJson = {'userName': userName, 'email': email};

      final UserProfile userProfile = UserProfile(
        userId: userId,
        userName: userName,
        email: email,
      );

      final json = userProfile.toJson();

      expect(json, expectedJson);
    });
  });
}
