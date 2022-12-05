import 'package:get/get.dart';
import 'package:synthesis/repository/authentication_repository.dart';

class ProfileController extends GetxController {

  static ProfileController get instance => Get.find();

   Rx<UserProfile?> userProfile = null.obs;

  @override
  void onInit() {
    super.onInit();
    print("merde");
    fetUserProfile();
  }

  Future<void> fetUserProfile() async {
      userProfile = Rx<UserProfile?>(await AuthenticationController.instance.getUserProfile().then((value){print(value.lastName);}));
  }


}

class UserProfile {
  final String id;
  final String lastName;
  final String firstName;
  final String phoneNo;

  UserProfile({
    required this.id,
    required this.lastName,
    required this.firstName,
    required this.phoneNo,
  });

  static UserProfile fromJson(Map<String, dynamic> json) => UserProfile(
        id: json['uid']?? '',
        lastName: json['lastName']?? '',
        firstName: json['firstName']?? '',
        phoneNo: json['phoneNo'] ?? '',
      );
}
