import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'jobdetails.dart';

class MyJobs extends StatelessWidget {
  const MyJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 113.h,
              ),
              Center(
                child: Wrap(
                  children: [
                    Text(
                      "Pending",
                      style: textStyle(
                        textBlack,
                        24.sp,
                        FontWeight.w700,
                      ),
                    ),
                    Text(
                      "  Tasks",
                      style: textStyle(
                        primaryGreen,
                        24.sp,
                        FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              taskCard(),
              SizedBox(
                height: 40.h,
              ),
              Wrap(
                children: [
                  Text(
                    "Job",
                    style: textStyle(
                      textBlack,
                      24.sp,
                      FontWeight.w700,
                    ),
                  ),
                  Text(
                    "  Details",
                    style: textStyle(
                      primaryGreen,
                      24.sp,
                      FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              jobStatusContainer(
                "#FFE39C",
                "#945900",
                "PENDING"
              ),
              SizedBox(
                height: 20.h,
              ),
              jobStatusContainer(
                "#03C852",
                "#016717",
                "APPROVED"
              ),
               SizedBox(
                height: 20.h,
              ),
              jobStatusContainer(
                "#FF4E4E",
                "#680000",
                "REJECTED"
              )
            ],
          ),
        ),
      ),
    );
  }
}
