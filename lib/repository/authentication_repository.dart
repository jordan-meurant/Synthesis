import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../features/authentication/screens/on_boarding/on_boarding_screen.dart';
import '../features/group/home_screen.dart';

class AuthenticationRepository extends GetxController {
  // use it every where if need it
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  late final Rx<User?> firebaseUser;

  late final User user;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setScreen);
  }

  _setScreen(User? user) {
    user == null
        ? Get.offAll(() => const OnBoardingScreen())
        : Get.offAll(() => const HomeScreen());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const HomeScreen())
          : Get.to(() => const OnBoardingScreen());
    } catch (e) {
      print(e);
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print("FIREBASE AUTHENTICATION EXCEPTION : ${e.code}");
      }
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> userSetup(
      String lastName, String firstName, String phoneNo) async {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');

    users.add({
      'lastName': lastName,
      'firstName': firstName,
      'phoneNo': phoneNo,
      'uid': firebaseUser.value?.uid.toString()
    });
  }
}
