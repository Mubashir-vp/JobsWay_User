import 'package:get/get.dart';
import 'package:jobs_way/controller/signup_controller/signup_controller.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var signUpController = Get.put(SignUpController());
    mode = signUpController.authModefetching();
  }

  String? mode;
}
