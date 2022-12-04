import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../features/authentication/screens/on_boarding/on_boarding_screen.dart';
import '../features/group/home_screen.dart';
import '../profile_controller.dart';

class AuthenticationRepository extends GetxController {
  // use it every where if need it
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;

  late final Rx<User?> firebaseUser;

  User get user => _auth.currentUser!;
  late UserProfile userProfile;

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
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

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
    CollectionReference users = _store.collection('Users');

    users.add({
      'lastName': lastName,
      'firstName': firstName,
      'phoneNo': phoneNo,
      'uid': firebaseUser.value?.uid.toString()
    });
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
      }
    } catch (_) {}
  }

  Future<UserProfile> getUserProfile() async {
    var response = await _store
        .collection('Users')
        .where('uid', isEqualTo: "RdyMVrk78yaSde0h9OoyyLu6uVr1")
        .limit(1)
        .get();

       return UserProfile.fromJson(response.docs.first.data());
      /*response.docs.forEach((doc) {
        print(doc.data());
      });*/
  }
}


