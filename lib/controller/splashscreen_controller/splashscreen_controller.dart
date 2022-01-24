import 'package:get/get.dart';
import 'package:jobs_way/view/introduction_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
Future.delayed(const Duration(seconds: 2), () {
Get.to(()=>const Introductionone());      });    
  }
}
