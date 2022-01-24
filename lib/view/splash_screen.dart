import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:get/get.dart';
import 'package:jobs_way/controller/splashscreen_controller/splashscreen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<SplashController>(
            init: SplashController(),
            builder: (controller) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 89.h,
                  ),
                  child: SizedBox(
                    height: 250.h,
                    width: 250.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "JobsWay.",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: primaryGreen,
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "Get the Right Jobs and\n           employees",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: subtextBlack,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
