import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:synthesis/controllers/authentication_controller.dart';
class SignInController extends GetxController{
  static SignInController get instance => Get.find();


  final email = TextEditingController();
  final password = TextEditingController();

  void login(String email, String password){
    AuthenticationController.instance.loginWithEmailAndPassword(email, password);
  }

}