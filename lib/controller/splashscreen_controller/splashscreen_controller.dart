import 'package:get/get.dart';
import 'package:jobs_way/controller/introduction_controller/introductionOne_controller.dart';
import 'package:jobs_way/controller/signup_controller/signup_controller.dart';
import 'package:jobs_way/view/homepage.dart';
import 'package:jobs_way/view/introduction_screen.dart';
import 'package:jobs_way/view/login.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // var introController = Get.put(IntroductionOneController());
    var signcontroller = Get.put(SignUpController());
    Future.delayed(const Duration(seconds: 2), () {
        signcontroller.logedChecking();
      
    });
  }
}
