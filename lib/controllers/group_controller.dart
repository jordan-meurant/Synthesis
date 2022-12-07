import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:synthesis/controllers/authentication_controller.dart';

class GroupController {
  static GroupController get instance => Get.find();

  final _store = FirebaseFirestore.instance;

  void logout() {
    AuthenticationController.instance.logout();
  }

  Future<void> createGroup(String name) async {

    CollectionReference group =_store.collection('Groups');
    group.add({'name':name}).then((value) => print(value.id));

  }

}
