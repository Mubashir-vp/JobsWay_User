import 'package:get/get.dart';
import 'package:jobs_way/controller/signup_controller/signup_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var signupController = Get.put(SignUpController());
    result = signupController.datasFetching();
    googleUser = signupController.user;
  }

  GoogleSignInAccount? googleUser;
  late List<String> result;
}
