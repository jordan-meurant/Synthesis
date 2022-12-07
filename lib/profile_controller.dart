import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:synthesis/controllers/authentication_controller.dart';

import 'models/userprofile.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  // ATTENTION NEED THIS CAST OR EXCEPTION WILL BE THROW
  late Rx<UserProfile?> userProfile = (null as UserProfile?).obs;
  var isLoading = false.obs;

  @override
  void onReady() {
    userProfile.bindStream(AuthenticationController.instance.getUserProfile());
    ever(userProfile, _setScreen);
  }

  _setScreen(UserProfile? userProfile) {
    if (userProfile != null) {
      isLoading.value = true;
    }
  }
}

