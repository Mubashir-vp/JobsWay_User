import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobs_way/view/login.dart';

class IntroductionOne extends GetxController {
  PageViewModel pageOne() {
    return PageViewModel(
      titleWidget: Column(
        children: [
          Wrap(
            children: [
              Text(
                "Get the",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: textBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 35.sp,
                  ),
                ),
              ),
              Text(
                " Right Job",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: primaryGreen,
                    fontWeight: FontWeight.w700,
                    fontSize: 35.sp,
                  ),
                ),
              ),
            ],
          ),
          Text(
            "You Deserve",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: textBlack,
                fontWeight: FontWeight.w700,
                fontSize: 40.sp,
              ),
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          Text(
            "Get new opportunity through JobsWay.",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: quatesText,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
      bodyWidget: Image.asset(
        "assets/intro1.png",
      ),
    );
  }

  PageViewModel pageTwo() {
    return PageViewModel(
      titleWidget: Column(
        children: [
          Wrap(
            children: [
              Text(
                "Why ",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: textBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 25.sp,
                  ),
                ),
              ),
              Text(
                "JobsWay.",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: primaryGreen,
                    fontWeight: FontWeight.w700,
                    fontSize: 25.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 22.h,
          ),
          Text(
            "   Make the right hires, faster with world’sleading recruiting platform",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: textBlack,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Text(
            "visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: quatesText,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
      bodyWidget: Column(
        children: [
          Image.asset("assets/intro2.png"),
          GestureDetector(
            onTap: () => Get.to(
              const LoginPage(),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: primaryGreen,
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
              ),
              width: 182.w,
              height: 56.h,
              child: Center(
                child: Text(
                  "Get Started",
                  style: GoogleFonts.poppins(
                    color: pureWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
