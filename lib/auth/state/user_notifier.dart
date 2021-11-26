import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pet_log/auth/model/logged_user_model.dart';
import 'package:pet_log/auth/model/user_profile.dart';
import 'package:pet_log/auth/repository/user_repository.dart';

class UserNotifier extends ChangeNotifier {
  final UserRepository _userRepository = UserRepository();

  StreamSubscription? _firebaseUserSubscription;
  StreamSubscription? _currentUserProfileSubscription;

  LoggedUserModel? _currentUser;

  LoggedUserModel? get currentUser => _currentUser;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  set _currentUserProfile(UserProfile? userProfile) {
    if (userProfile?.userId == _currentUser?.firebaseUser?.uid) {
      _currentUser = LoggedUserModel(_currentUser?.firebaseUser, userProfile);
    }
  }

  UserNotifier() {
    _firebaseUserSubscription = _userRepository.currentFirestoreUserStream
        .listen(_firebaseUserListener);
  }

  Future<void> _firebaseUserListener(User? firebaseUser) async {
    _currentUser = LoggedUserModel(firebaseUser, _currentUser?.profile);

    if (firebaseUser != null) {
      _currentUserProfileSubscription?.cancel();
      _currentUserProfileSubscription = _userRepository
          .currentUserProfileStream(firebaseUser.uid)
          .listen(_userProfileListener);
    } else {
      _currentUserProfile = null;
    }
    notifyListeners();
  }

  void _userProfileListener(UserProfile? profile) async {
    _currentUserProfile = profile;
    if (profile == null) {
      final bool isProfileExist =
          await isUserProfileExist(profile?.userId.toString());

      if (!isProfileExist) await _createUserProfile();
    }

    notifyListeners();
  }

  Future<void> _createUserProfile() async {
    UserProfile userProfile = UserProfile(
      userId: _currentUser?.firebaseUser?.uid,
      userName: _currentUser?.firebaseUser?.displayName,
      email: _currentUser?.firebaseUser?.email,
    );
    _currentUserProfile = userProfile;
    addUser(userProfile);
  }

  Future<void> signInWithEmailPassword(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } finally {
      notifyListeners();
    }
  }

  Future<void> registerNewUser(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> logOut() async {
    _currentUserProfile = null;
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
        if (googleSignInAuthentication.accessToken != null) {
          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );

          await firebaseAuth.signInWithCredential(credential);
        }
      }
    }
    catch(e){
      print(e.toString());
    }
  }

  Future<void> addUser(UserProfile user) async {
    await _userRepository.createUserProfile(user);
  }

  Future<bool> isUserProfileExist(String? userId) async {
    return await _userRepository.isUserExists(userId);
  }
}
