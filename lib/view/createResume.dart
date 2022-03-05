import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_way/constants/constants.dart';

class CreateResume extends StatelessWidget {
  const CreateResume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Wrap(
                  children: [
                    Text(
                      "Build your",
                      style: textStyle(
                        textBlack,
                        28.sp,
                        FontWeight.w800,
                      ),
                    ),
                    Text(
                      " Jobsway Resume",
                      style: textStyle(
                        primaryGreen,
                        28.sp,
                        FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70.h,
                ),
                Row(children: [
                  Expanded(
                    child: Column(
                      children: [
                        formField(
                          "First Name",
                           false,
                            TextInputType.name,
                       width:    240.0.w,
                         height:  57.0.h,
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        formField(
                          "Last Name",
                           false,
                            TextInputType.name,
                         width:  240.0.w,
                        height:   57.0.h,
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        formField(
                          "Job Title",
                           false,
                            TextInputType.name,
                        width:   240.0.w,
                        height:   57.0.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: quatesText,
                          borderRadius: BorderRadius.circular(10.r)),
                      width: 120.w,
                      height: 120.h,
                      child: const Center(
                        child: Icon(
                          Icons.account_box,
                        ),
                      ),
                    ),
                  )
                ]),
                SizedBox(
                  height: 31.h,
                ),
                formField(
                  "About you",
                   false,
                            TextInputType.name,
                width:   331.w,
                 height:  110.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
