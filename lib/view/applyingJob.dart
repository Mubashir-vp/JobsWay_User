import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:jobs_way/view/homepage.dart';

class ApplyingJob extends StatelessWidget {
  const ApplyingJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 90.h,
              ),
              Wrap(
                children: [
                  Text(
                    "Applying for ",
                    style: textStyle(
                      textBlack,
                      24.sp,
                      FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Sr.Web Devoloper",
                    style: textStyle(
                      primaryGreen,
                      24.sp,
                      FontWeight.w700,
                    ),
                  )
                ],
              ),
              SizedBox(height: 25.h),
              Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt_sharp,
                      color: pureWhite,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "Add A Photo",
                      style: textStyle(
                        pureWhite,
                        15.sp,
                        FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                height: 100.h,
                width: 180.w,
                decoration: BoxDecoration(
                  color: fullBlack,
                  borderRadius: BorderRadius.circular(
                    8.r,
                  ),
                ),
              ),
              SizedBox(
                height: 34.h,
              ),
              formField(
                "First Name",
              ),
              SizedBox(
                height: 34.h,
              ),
              formField(
                "Last Name",
              ),
              SizedBox(
                height: 34.h,
              ),
              formField(
                "E-mail",
              ),
              SizedBox(
                height: 34.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: formField(
                      "Years.of.Exp",
                    ),
                  ),
                  SizedBox(
                    width: 34.h,
                  ),
                  Expanded(
                    child: formField(
                      "Portfolio link",
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 34.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: formField(
                      "Phone",
                    ),
                  ),
                  SizedBox(
                    width: 34.w,
                  ),
                  Expanded(
                    child: formField(
                      "Location",
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 47.h,
              ),
              Center(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Upload Resume",
                        style: textStyle(
                          HexColor(
                            "0B0A0A",
                          ),
                          15.sp,
                          FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Icon(
                        Icons.upload_file,
                        color: fullBlack,
                      )
                    ],
                  ),
                  width: 180.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: quatesText,
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Wrap(
                children: [
                  Text(
                    "Don’t have one? No worries Create a ",
                    style: textStyle(
                      textBlack,
                      14.sp,
                      FontWeight.normal,
                     

                    ),
                  ),
                  Text(
                    "JobsWay Resume",
                    style: textStyle(
                      primaryGreen,
                      14.sp,
                      FontWeight.bold,
                       TextDecoration.underline,
                      primaryGreen,
                      TextDecorationStyle.wavy
                    ),
                  ),
                ],
              ),
               SizedBox(
                height: 40.h,
              ),
                 Center(
                  child: GestureDetector(
                    onTap: ()=>Get.to(()=>const Home()),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Confirm Application',
                        style: textStyle(
                          pureWhite,
                          20.sp,
                          FontWeight.w800,
                        ),
                      ),
                      width: 312.w,
                      height: 58.h,
                      decoration: BoxDecoration(
                        color:primaryGreen,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                height: 60.h,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
