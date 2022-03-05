import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobs_way/api_services/googlesignin_api.dart';
import 'package:jobs_way/api_services/httpService.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:jobs_way/controller/signup_controller/signup_controller.dart';
import 'package:jobs_way/model/otp_model.dart';
import 'package:jobs_way/model/signup.dart';
import 'package:jobs_way/model/signup_model.dart';
import 'package:jobs_way/view/login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:jobs_way/view/homepage.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GoogleSignInApi googleSignInApi = GoogleSignInApi();

    final formkey = GlobalKey<FormState>();
    HttpService httpService = HttpService();

    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 5.h),
          child: SingleChildScrollView(
            child: GetBuilder<SignUpController>(
                init: SignUpController(),
                builder: (controller) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 30.h,
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
                          key: formkey,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: formField(
                                      "First Name",
                                      false,
                                      TextInputType.name,
                                      controller: controller.firstName,
                                      validator: (val) {
                                        if (val == "") {
                                          return "This field is required";
                                        }
                                        if (val.length < 4) {
                                          return "Minium 4 characters required";
                                        }
                                        if (val.length > 15) {
                                          return "Maximum 15 characters allowed";
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 13.w,
                                  ),
                                  Expanded(
                                    child: formField(
                                      "Last Name",
                                      false,
                                      TextInputType.name,
                                      controller: controller.lastName,
                                      validator: (val) {
                                        if (val == "") {
                                          return "This field is required";
                                        }
                                        if (val.length < 2) {
                                          return "Minium 4 characters required";
                                        }
                                        if (val.length > 10) {
                                          return "Maximum 10 characters allowed";
                                        }
                                      },
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              formField(
                                "Phone Number",
                                false,
                                const TextInputType.numberWithOptions(
                                    decimal: false),
                                controller: controller.phoneNumber,
                                validator: (val) {
                                  if (val == "") {
                                    return "This field is required";
                                  }
                                  if (val.length != 10) {
                                    return "Invalid Phone no";
                                  }
                                },
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              formField("Email (optional)", false,
                                  TextInputType.emailAddress,
                                  controller: controller.email,
                                  validator: (value) {
                                EmailValidator.validate(value)
                                    ? null
                                    : "Please enter a valid email";
                              }),
                              SizedBox(
                                height: 30.h,
                              ),
                              formField(
                                  "Password",
                                  controller.eyesOpen,
                                  const TextInputType.numberWithOptions(
                                      decimal: false),
                                  suffix: controller.eye(),
                                  controller: controller.password,
                                  validator: (val) {
                                if (val == "") {
                                  return "This field is required";
                                }
                                if (val.length <= 8) {
                                  return "Minimum 8 characters required";
                                }
                                if (val.length > 10) {
                                  return "Maximum 10 characters allowed";
                                }
                              }),
                              SizedBox(
                                height: 30.h,
                              ),
                              formField(
                                "Repeat Password",
                                controller.eyesOpen,
                                const TextInputType.numberWithOptions(
                                    decimal: false),
                                controller: controller.confirmPassword,
                                validator: (
                                  val,
                                ) {
                                  if (val == "") {
                                    return "This field is required";
                                  }
                                  if (val.length <= 8) {
                                    return "Minimum 8 characters required";
                                  }
                                  if (val.length > 10) {
                                    return "Maximum 8 characters allowed";
                                  }
                                  if (controller.password.text !=
                                      controller.confirmPassword.text) {
                                    return "Password didn't match";
                                  }
                                },
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  if (formkey.currentState!.validate()) {
                                    const base = "signup";
                                    var data = {
                                      "firstName": controller.firstName.text,
                                      "lastName": controller.lastName.text,
                                      "password": controller.password.text,
                                      "phone": controller.phoneNumber.text,
                                      "email": controller.email.text,
                                      "authmode": "phone"
                                    };
                                    Welcome? response =
                                        await httpService.signUpPostData(
                                      data,
                                      base,
                                    );

                                    if (response != null) {
                                      await Get.bottomSheet(
                                        SingleChildScrollView(
                                          child: SizedBox(
                                            height: MediaQuery.of(
                                                  context,
                                                ).size.height /
                                                1.4,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 200.h,
                                                  width: 200.w,
                                                  child: Image.asset(
                                                    "assets/undraw_Message_sent_re_q2kl-removebg-preview.png",
                                                  ),
                                                ),
                                                Text(
                                                  "VERIFICATION",
                                                  style: textStyle(
                                                    primaryGreen,
                                                    30.sp,
                                                    FontWeight.w900,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 18.h,
                                                ),
                                                Text(
                                                  "Enter OTP code sent to your number",
                                                  style: textStyle(
                                                    primaryGreen,
                                                    15.sp,
                                                    FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 18.h,
                                                ),
                                                Text(
                                                  controller.phoneNumber.text,
                                                  style: textStyle(
                                                    primaryGreen,
                                                    15.sp,
                                                    FontWeight.w900,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 30.h,
                                                ),
                                                OtpTextField(
                                                  numberOfFields: 6,
                                                  borderColor: fullBlack,
                                                  focusedBorderColor:
                                                      primaryGreen,
                                                  showFieldAsBox: true,
                                                  onCodeChanged: (
                                                    String code,
                                                  ) {},
                                                  onSubmit: (String
                                                      verificationCode) async {
                                                    const base = "verifyotp";
                                                    log("heeeeeee${controller.firstName.text}");
                                                    final otpData = {
                                                      "otp": verificationCode,
                                                      'userDetails': {
                                                        "firstName": controller
                                                            .firstName.text
                                                            .trim(),
                                                        "lastName": controller
                                                            .lastName.text
                                                            .trim(),
                                                        "password": controller
                                                            .password.text,
                                                        "phone": controller
                                                            .phoneNumber.text,
                                                        "email": response
                                                            .userDetails!.email,
                                                      }
                                                    };

                                                    Otp? respos =
                                                        await httpService
                                                            .verifyOtp(
                                                      otpData,
                                                      base,
                                                    );
                                                    if (respos != null) {
                                                      if (respos.user!.ban ==
                                                          false) {
                                                        controller.datasSaving(
                                                          name:
                                                              respos.user!.name,
                                                          email: respos
                                                              .user!.email, id: respos.user!.id,
                                                        );
                                                        controller
                                                            .authModeSaving(
                                                          authMode: "phone",
                                                        );
                                                        controller
                                                            .logintrueFunction();
                                                        Get.off(
                                                            () => const Home());
                                                      }
                                                    }
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 18.h,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        backgroundColor: pureWhite.withOpacity(
                                          0.99,
                                        ),
                                      );
                                    }
                                    if (response == null) {
                                      Get.snackbar(
                                        "Signup Failed",
                                        "Signup Failed, please try again",
                                      );
                                    }
                                  }
                                },
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
                                height: 28.h,
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
                                height: 28.h,
                              ),
                              SignInButton(
                                Buttons.Google,
                                text: "Sign up with Google",
                                onPressed: () async {
                                  List<String> splitStringByLength(
                                          String str, int length) =>
                                      [
                                        str.substring(0, length),
                                        str.substring(length)
                                      ];
                                  var google = await controller
                                      .googleSignin()
                                      .whenComplete(() => null);

                                  if (controller.user != null) {
                                    var length =
                                        controller.user!.displayName!.length;
                                    String name = controller.user!.displayName!;
                                    var nameList =
                                        splitStringByLength(name, length - 1);
                                    final googleData = {
                                      "firstName": nameList[0],
                                      "lastName": nameList[1],
                                      "password": controller.user!.id,
                                      "email": controller.user!.email,
                                      "authmode": "email"
                                    };
                                    Otp? response = await httpService
                                        .googlePost(googleData, "googlesign");
                                    if (response != null) {
                                      if (response.user!.ban == false) {
                                        controller.datasSaving(
                                          name: response.user!.name,
                                          email: response.user!.email, id: response.user!.id,
                                          
                                        );
                                        controller.logintrueFunction();
                                        controller.authModeSaving(
                                          authMode: "google",
                                        );
                                        Get.off(() => const Home());
                                      }
                                    } else {
                                      Get.snackbar(
                                        "Signup Failed",
                                        "Signup Failed, please try again",
                                      );
                                    }
                                  }
                                },
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
                  );
                }),
          )),
    ));
  }
}

// {
//   "email":"gsfgdg",
//   "firstName": "fdfdf",
//   "lastName":"hfjhkjs",
//   "password":"jfhsdjkfhs"}
//   /googlesignin
