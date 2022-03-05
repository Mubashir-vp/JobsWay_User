import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobs_way/api_services/googlesignin_api.dart';
import 'package:jobs_way/api_services/httpService.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_way/controller/loginscreen_controlller/loginscreen_controller.dart';
import 'package:jobs_way/controller/signup_controller/signup_controller.dart';
import 'package:jobs_way/model/otp_model.dart';
import 'package:jobs_way/view/signup.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:jobs_way/view/homepage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HttpService httpService = HttpService();
    GoogleSignInApi googleSignInApi = GoogleSignInApi();

    var signupController = Get.put(SignUpController());
    return SafeArea(
      child: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) {
            return Scaffold(
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
                            formField(
                              'Phone',
                              false,
                              const TextInputType.numberWithOptions(
                                  decimal: false),
                              controller: controller.phoneController,
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
                            formField(
                                'Password',
                                controller.eyesOpen,
                                const TextInputType.numberWithOptions(
                                    decimal: false),
                                suffix: controller.eye(),
                                controller: controller.passwordController,
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
                              height: 80.h,
                            ),
                            GestureDetector(
                              onTap: () async {
                                var data = {
                                  "phone": controller.phoneController.text,
                                  "password":
                                      controller.passwordController.text,
                                  "authmode": "phone",
                                };
                                var response = await httpService.userlogin(
                                  data,
                                );
                                if (response != null) {
                                  signupController.conditionFunction(true);
                                  signupController.authModeSaving(
                                    authMode: "phone",

                                  );
                                  signupController.datasSaving(
                                        name: response.user!.name,
                                        email: response.user!.email, id: response.user!.id,
                                      );
                                  Get.to(
                                    () => const Home(),
                                  );
                                }
                              },
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
                              onPressed: () async {
                                List<String> splitStringByLength(
                                        String str, int length) =>
                                    [
                                      str.substring(0, length),
                                      str.substring(length)
                                    ];
                                var google = await signupController
                                    .googleSignin()
                                    .whenComplete(() => null);

                                if (signupController.user != null) {
                                  log("gott");
                                  var length = signupController
                                      .user!.displayName!.length;
                                  String name =
                                      signupController.user!.displayName!;
                                  var nameList =
                                      splitStringByLength(name, length - 1);
                                  final googleData = {
                                    "firstName": nameList[0],
                                    "lastName": nameList[1],
                                    "password": signupController.user!.id,
                                    "email": signupController.user!.email,
                                  };
                                  Otp? response = await httpService.googlePost(
                                      googleData, "googlesign");
                                  if (response != null) {
                                    if (response.user!.ban == false) {
                                      signupController.datasSaving(
                                        name: response.user!.name,
                                        email: response.user!.email,
                                        id: response.user!.id
                                      );
                                      signupController.authModeSaving(
                                          authMode: "google");
                                      signupController.conditionFunction(true);
                                      Get.off(() => const Home());
                                    }
                                  } else {
                                    Get.snackbar(
                                      "Signup Failed",
                                      "Signup Failed, please try again",
                                    );
                                  }
                                } else {
                                  log("emopty");
                                }
                              },
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
            );
          }),
    );
  }
}
