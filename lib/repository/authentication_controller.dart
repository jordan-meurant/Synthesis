import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../features/authentication/screens/on_boarding/on_boarding_screen.dart';
import '../features/group/home_screen.dart';
import '../models/userprofile.dart';
import '../profile_controller.dart';

class AuthenticationController extends GetxController {
  // use it every where if need it
  static AuthenticationController get instance => Get.find();

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

  Future<void> userSetup(String? displayName, String? email,
      {String? phoneNo, String? imageURL}) async {
    _store.collection('Users').doc(user.uid).set({
      'displayName': displayName ?? '/',
      'phoneNo': phoneNo ?? '/',
      'imageURL': imageURL ?? '/',
      'email': email ?? '/',
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
        print(userCredential.user);
        if (userCredential.user != null) {
          if (userCredential.additionalUserInfo!.isNewUser) {
            userSetup(
                userCredential.user!.displayName, userCredential.user!.email,
                phoneNo: userCredential.user!.phoneNumber,
                imageURL: userCredential.user!.photoURL);
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      print("EXCEPTION 8888");
      print(e.code);
    }
  }

  Stream<UserProfile> getUserProfile() {
    return _store
        .collection("Users")
        .doc(user.uid)
        .snapshots()
        .map((s) => UserProfile.fromSnapshot(s));
  }
}
