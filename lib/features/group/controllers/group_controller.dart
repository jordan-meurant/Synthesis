import 'package:get/get.dart';
import 'package:synthesis/repository/authentication_repository.dart';
class GroupController {
  static GroupController get instance => Get.find();

  void logout(){
    AuthenticationController.instance.logout();
  }
}