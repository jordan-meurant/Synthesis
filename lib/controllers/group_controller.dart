import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:synthesis/controllers/authentication_controller.dart';
import 'package:synthesis/screens/home_screen.dart';

class GroupController {
  static GroupController get instance => Get.find();

  final _store = FirebaseFirestore.instance;

  final groupName = TextEditingController();

  void logout() {
    AuthenticationController.instance.logout();
  }

  Future<void> createGroup(String name) async {
    CollectionReference group = _store.collection('Groups');
    String groupId = "";
    group.add({'name': name}).then((value) {
      groupId = value.id;
      group
          .doc(groupId)
          .collection('participants')
          .doc(AuthenticationController.instance.user.uid)
          .set({'admin': true});
    }).then((value) {
      updateUserProfile(groupId);
    }).then((value) {
      Get.offAll(() => const HomeScreen());
      Get.snackbar('Le groupe $name a été créé avec succès !',
          'Sélectionne-le pour voir les cours !',
          backgroundColor: CupertinoColors.activeGreen,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5));
    });
  }

  Future<void> updateUserProfile(String groupId) async {
    _store
        .collection('Users')
        .doc(AuthenticationController.instance.user.uid)
        .collection('groups')
        .doc(groupId)
        .set({});
  }

  Stream<List<String>> getGroups() {
    return _store
        .collection("Users")
        .doc(AuthenticationController.instance.user.uid)
        .collection('groups')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((group) => group.id).toList();
    });
  }
}
