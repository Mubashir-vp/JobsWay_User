import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:jobs_way/view/login.dart';
import 'package:jobs_way/view/signup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:jobs_way/view/homepage.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 29.w,
            vertical: 5.h
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Center(
                  child: Text(
                    "Welcome To JobsWay.",
                    style: textStyle(
                      textBlack,
                      25.sp,
                      FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                Form(
                    child: Column(
                  children: [
                    Row(children: [
                      Expanded(child: formField(
                      "First Name",
                    ),),
                      
                    SizedBox(width: 13.w,),
                    Expanded(child: formField(
                      "Last Name",
                    ),)
                     
          
                    ],),
                    
                    
                    
                   
                    SizedBox(
                      height: 30.h,
                    ),
                    formField("Email"),
                    SizedBox(
                      height: 30.h,
                    ),
                    formField(
                      "Password",
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    formField("Repeat Password"),
                    SizedBox(
                        height: 50.h,
                      ),
                     GestureDetector(
                        onTap: ()=>Get.to(()=>const Home()),
                        child: Container(
                          child: Center(
                            child: Text(
                              "Sign Up",
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
                        height: 35.h,
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
                        height: 35.h,
                      ),
                      SignInButton(
                        Buttons.Google,
                        text: "Sign up with Google",
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() => const LoginPage()),
                        child: Wrap(
                          children: [
                            Text(
                              "Already on jobsWay?  ",
                              style: textStyle(
                                textBlack,
                                16.sp,
                                FontWeight.w500,
                              ),
                            ),
                            Text(
                              " Sign In",
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
                ))
              ],
            ),
          )),
    ));
  }
}
