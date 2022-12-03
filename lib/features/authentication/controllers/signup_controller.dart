import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:synthesis/repository/authentication_repository.dart';
class SignUpController {
  // use it every where if need it
  static SignUpController get instance => Get.find();

  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final email = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();

  void registerUser(String email, String password){
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }

}