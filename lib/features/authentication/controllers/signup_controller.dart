import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:synthesis/repository/authentication_repository.dart';

class SignUpController extends GetxController{
  // use it every where if need it
  static SignUpController get instance => Get.find();

  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final email = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();

  Future<void> registerUser(String lastName, String firstName, String phoneNo,
      String email, String password) async {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password)
        .then((value) => AuthenticationRepository.instance
            .userSetup(lastName, firstName, phoneNo));
  }
}
