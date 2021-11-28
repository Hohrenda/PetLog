import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_log/auth/model/user_profile.dart';

class LoggedUserModel {
  final User? firebaseUser;
  final UserProfile? profile;

  LoggedUserModel(this.firebaseUser, this.profile);
}
