import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobs_way/view/user_profileDetailsAdd.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'applyingJob.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                SizedBox(
                  height: 70.h,
                ),
                Center(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 18.h,
                        ),
                        CircleAvatar(
                          radius: 60.r,
                          backgroundImage: const AssetImage(
                            "assets/dp.jpg",
                          ),
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        Text(
                          "Mubashir.vp",
                          style: textStyle(
                            textBlack,
                            20.sp,
                            FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Flutter Developer",
                          style: textStyle(
                            textBlack,
                            17.sp,
                            FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(23.0),
                          child: SizedBox(
                            height: 50.h,
                            width: MediaQuery.of(context).size.width,
                            child: GridView.builder(
                                itemCount: 9,
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  crossAxisSpacing: 9.0,
                                  mainAxisSpacing: 10.0,
                                ),
                                itemBuilder: (context, index) {
                                  return Container(
                                    child: Center(
                                      child: Text(
                                        "Dart",
                                        style: textStyle(
                                          pureWhite,
                                          11.sp,
                                          FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    
                                    decoration: BoxDecoration(
                                      color: fullBlack,
                                      borderRadius: BorderRadius.circular(
                                        10.r,
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
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
                        SizedBox(height: 19.h,),
                              GestureDetector(
                          onTap: ()=>Get.to(()=>const UserDetailsAdd()),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Edit Your Details',
                              style: textStyle(
                                pureWhite,
                                16.sp,
                                FontWeight.w600,
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 28.h,
                            decoration: BoxDecoration(
                              color: HexColor(
                                "#0060A5",
                              ),
                              
                            ),
                          ),
                        ),
                        
                      ],
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
                    height: 450.h,
                  ),
                ),
                SizedBox(height: 38.h,),
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
                        text: '  Kerala, india',
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
                  height: 20.h,
                ),
                  RichText(
                  text: TextSpan(
                    text: 'Email            :',
                    style: textStyle(
                      fullBlack,
                      15.sp,
                      FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '  Mubashir.vp14@gmail.com',
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
                  height: 20.h,
                ),
                 RichText(
                  text: TextSpan(
                    text: 'Phone          :',
                    style: textStyle(
                      fullBlack,
                      15.sp,
                      FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '  9656234320',
                        style: textStyle(
                          fullBlack,
                          15.sp,
                          FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ])),
        ),
      ),
    );
  }
}
