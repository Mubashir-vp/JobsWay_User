import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:jobs_way/controller/introduction_controller/introductionOne_controller.dart';

class Introductionone extends StatelessWidget {
  const Introductionone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(IntroductionOne());

    List<PageViewModel> pages = [controller.pageOne(), controller.pageTwo()];
    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 39.h, vertical: 50.w),
          child: IntroductionScreen(
            pages: pages,
            showNextButton: false,
            dotsDecorator: DotsDecorator(
              size: const Size.square(
                10.0,
              ),
              activeSize: const Size(
                50.0,
                10.0,
              ),
              activeColor: primaryGreen,
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(
                horizontal: 3.0,
              ),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  25.0.r,
                ),
              ),
            ),
            showDoneButton: false,
          )),
    ));
  }
}
