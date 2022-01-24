import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_way/view/signup.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:jobs_way/view/homepage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 104.h,
                ),
                Center(
                  child: Text(
                    "Sign In to jobsWay.",
                    style: textStyle(
                      textBlack,
                      25.sp,
                      FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 67.h,
                ),
                Form(
                  child: Column(
                    children: [
                      formField('Email or phone'),
                      SizedBox(
                        height: 30.h,
                      ),
                      formField('Password'),
                      SizedBox(
                        height: 80.h,
                      ),
                      GestureDetector(
                        onTap: ()=>Get.to(()=>const Home()),
                        child: Container(
                          child: Center(
                            child: Text(
                              "Sign In",
                              style: textStyle(
                                pureWhite,
                                15.sp,
                                FontWeight.normal,
                              ),
                            ),
                          ),
                          height: 45.h,
                          width: 128.w,
                          decoration: BoxDecoration(
                            color: primaryGreen,
                            borderRadius: BorderRadius.circular(
                              10.r,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 47.h,
                      ),
                      Text(
                        "Or",
                        style: textStyle(
                          HexColor(
                            "#8B8B8B",
                          ),
                          14.sp,
                          FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      SignInButton(
                        Buttons.Google,
                        text: "Sign In with Google",
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 49.h,
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() => const SignUp()),
                        child: Wrap(
                          children: [
                            Text(
                              "New to jobsWay? ",
                              style: textStyle(
                                textBlack,
                                16.sp,
                                FontWeight.w500,
                              ),
                            ),
                            Text(
                              " Sign Up",
                              style: textStyle(
                                primaryGreen,
                                16.sp,
                                FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
