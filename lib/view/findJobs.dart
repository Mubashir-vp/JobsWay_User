import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FindJobs extends StatelessWidget {
  const FindJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> item = [jobCard()];
    return SafeArea(
      child: Scaffold(
          body:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 113.h),
          child: Column(
            children: [
              findJobssearchformField(
                "Job title or Company",
                FontAwesomeIcons.building,
              ),
              SizedBox(
                height: 25.h,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Center(
                    child: Text(
                      "Search",
                      style: textStyle(
                        pureWhite,
                        15.sp,
                        FontWeight.normal,
                      ),
                    ),
                  ),
                  height: 35.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.circular(
                      7.r,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              Expanded(
                flex: 9,
                child: jobCardList(jobCard(), Axis.vertical,height: 24.h),
              ),
              const Spacer(
              )
            ],
          ),
        ),
      ),
    );
  }
}
