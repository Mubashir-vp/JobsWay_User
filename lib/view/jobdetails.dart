import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobs_way/view/applyingJob.dart';
import 'package:get/get.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 13.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 52.h,
                ),
                Center(
                  child: companyCard(
                    pureWhite,
                    [
                      BoxShadow(
                        color: Colors.grey.withOpacity(
                          0.4,
                        ),
                        spreadRadius: 8,
                        blurRadius: 5,
                        offset: const Offset(
                          0,
                          5,
                        ), // 
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 59.h,
                ),
                Text(
                  "Experience                 : 4 - 8 years",
                  style: textStyle(
                    fullBlack,
                    15.sp,
                    FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Posted Date              : 29-11-1998",
                  style: textStyle(
                    fullBlack,
                    15.sp,
                    FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "No.of.Applicants     : 4",
                  style: textStyle(
                    fullBlack,
                    15.sp,
                    FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 41.h,
                ),
                Text(
                  "Sr.Web developer",
                  style: textStyle(
                    textBlack,
                    40.sp,
                    FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 300.w,
                      child: Text(
                        '₹ 30000 - 50000',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: textStyle(
                          HexColor(
                            "#00B512",
                          ),
                          29.sp,
                          FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                      child: Text(
                        'Full time',
                        style: textStyle(
                          textBlack,
                          14.sp,
                          FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Qualifications :",
                  style: textStyle(
                    textBlack,
                    20.sp,
                    FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 11.h,
                ),
                qualifications(),
                SizedBox(
                  height: 21.h,
                ),
                qualifications(),
                SizedBox(
                  height: 21.h,
                ),
                qualifications(),
                SizedBox(
                  height: 21.h,
                ),
                qualifications(),
                SizedBox(
                  height: 25.h,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Education     :',
                    style: textStyle(
                      fullBlack,
                      15.sp,
                      FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Bachlor of ComputerAppliction',
                        style: textStyle(
                          fullBlack,
                          15.sp,
                          FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 53.h,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Languages     :',
                    style: textStyle(
                      fullBlack,
                      15.sp,
                      FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' English , Malayalam , Hindi , Spanish',
                        style: textStyle(
                          fullBlack,
                          15.sp,
                          FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 44.h,
                ),
                Row(
                  children: [
                    Text(
                      "Skills     :",
                      style: textStyle(
                        fullBlack,
                        15.sp,
                        FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 23.w,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: GridView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 9.0,
                              mainAxisSpacing: 10.0,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                child: Center(
                                  child: Text(
                                    "HTML",
                                    style: textStyle(
                                      pureWhite,
                                      14.sp,
                                      FontWeight.w600,
                                    ),
                                  ),
                                ),
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: primaryGreen,
                                  borderRadius: BorderRadius.circular(
                                    10.r,
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: ()=>Get.to(()=>const ApplyingJob()),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Apply Now',
                        style: textStyle(
                          pureWhite,
                          20.sp,
                          FontWeight.w800,
                        ),
                      ),
                      width: 312.w,
                      height: 58.h,
                      decoration: BoxDecoration(
                        color: primaryGreen,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 52.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
