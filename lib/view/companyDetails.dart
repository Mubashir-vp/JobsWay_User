import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jobs_way/view/user_profileDetailsAdd.dart';

class CompanyDetails extends StatelessWidget {
  const CompanyDetails({Key? key}) : super(key: key);

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
              height: 40.h,
            ),
            Center(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.0.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 18.h,
                      ),
                      Center(
                        child: Material(
                          elevation: 10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              10.r,
                            ),
                            child: SizedBox(
                              height: 60.h,
                              width: 60.w,
                              child: Image.asset(
                                "assets/985_google_g_icon.jpg",
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      Center(
                        child: Text(
                          "Google",
                          style: textStyle(
                            textBlack,
                            20.sp,
                            FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Website     :',
                          style: textStyle(
                            fullBlack,
                            15.sp,
                            FontWeight.w500,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '  www.google.com',
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
                        height: 26.h,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Location     :',
                          style: textStyle(
                            fullBlack,
                            15.sp,
                            FontWeight.w500,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '  chettipadi,PGDI',
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
                        height: 30.h,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Email     :',
                          style: textStyle(
                            fullBlack,
                            15.sp,
                            FontWeight.w500,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '  Google369@gmail.com',
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
                        height: 30.h,
                      ),
                      Text(
                        'Bio     :',
                        style: textStyle(
                          fullBlack,
                          15.sp,
                          FontWeight.w500,
                        ),
                      ),
                      Text(
                        'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful contentument or a typeface without relying on meaningful contentument or a typeface without relying on meaningful content. ',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: textStyle(
                          fullBlack,
                          14.sp,
                          FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.instagram,
                            color: primaryGreen,
                          ),
                          SizedBox(
                            width: 19.w,
                          ),
                          FaIcon(
                            FontAwesomeIcons.facebook,
                            color: primaryGreen,
                          ),
                          SizedBox(
                            width: 19.w,
                          ),
                          FaIcon(
                            FontAwesomeIcons.linkedin,
                            color: primaryGreen,
                          ),
                          SizedBox(
                            width: 19.w,
                          ),
                          FaIcon(
                            FontAwesomeIcons.twitter,
                            color: primaryGreen,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: pureWhite,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
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
                    ]),
                width: 325.w,
                height: 500.h,
              ),
            ),
            SizedBox(
              height: 28.h,
            ),
            RichText(
              text: TextSpan(
                text: 'Jobs by',
                style: textStyle(
                  fullBlack,
                  30.sp,
                  FontWeight.w900,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Google:',
                    style: textStyle(
                      primaryGreen,
                      30.sp,
                      FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
                        SizedBox(height: 20.h,),
      
            Expanded(
              child: jobCardList(jobCard(), Axis.horizontal,width: 17.w),
            ),
            SizedBox(height: 50.h,),
          ],
        ),
      ),
    ));
  }
}
