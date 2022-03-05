import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_way/api_services/googlesignin_api.dart';
import 'package:jobs_way/api_services/httpService.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobs_way/controller/introduction_controller/introductionOne_controller.dart';
import 'package:jobs_way/view/homepage.dart';
import 'package:jobs_way/view/introduction_screen.dart';
import 'package:jobs_way/view/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    sharedPreference = await SharedPreferences.getInstance();
  }

  var isLoggedIn = "false";
  bool? isLogged;
  conditionFunction(bool value) async {
    WidgetsFlutterBinding.ensureInitialized();
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setBool(isLoggedIn, value);
    isLogged = sharedPreference.getBool(isLoggedIn);
    update();
  }

  logintrueFunction() async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setBool(isLoggedIn, true);
  }

  loginfalseFunction() async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setBool(isLoggedIn, false);
  }

  var introController = Get.put(IntroductionOneController());
  logedChecking() async {
    WidgetsFlutterBinding.ensureInitialized();
    final sharedPreference = await SharedPreferences.getInstance();
    isLogged = sharedPreference.getBool(isLoggedIn);
    introController.firstuser =
        sharedPreference.getBool(introController.isFirstUser);
    if (introController.firstuser == true ||
        introController.firstuser == null) {
      Get.to(() => const Introductionone());
    } else if (introController.firstuser == false && isLogged == false ||
        isLogged == null) {
      Get.to(() => const LoginPage());
    } else {
      log("firstuser${introController.firstuser}");
      log("isLogged$isLogged");

      Get.to(() => const Home());
    }

    update();
  }

  var sharedPreference;
  bool eyesOpen = true;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  HttpService httpService = HttpService();
  var sharedList;
  var sharedUsername;
  var sharedEmail;
  var sharedId;
  var sharedAuthMode;
  datasSaving({
    var name,
    var email,
    required var id,
  }) async {
    final List<String> map = [
      sharedUsername = name,
      sharedEmail = email,
      sharedId=id,
    ];

    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setStringList("sharedList", map);
  }

  authModeSaving({var authMode}) async {
    sharedPreference.setString("sharedAuthMode", authMode);
    update();
  }

  String authModefetching() {
    String mode = sharedPreference.getString("sharedAuthMode");
    return mode;
  }

  List<String> datasFetching() {
    var result = sharedPreference.getStringList("sharedList");
    log(result![0]);
    return result;
  }

  eye() {
    return GestureDetector(
      onTap: () {
        if (eyesOpen == false) {
          eyesOpen = true;
        } else {
          eyesOpen = false;
        }
        update();
      },
      child: FaIcon(
        eyesOpen == false ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
        color: primaryGreen,
      ),
    );
  }

  otpSheet(var context, var phone, var data) {
    return Get.bottomSheet(
      SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.4,
          child: Column(
            children: [
              SizedBox(
                height: 200.h,
                width: 200.w,
                child: Image.asset(
                    "assets/undraw_Message_sent_re_q2kl-removebg-preview.png"),
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
                phone,
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
                focusedBorderColor: primaryGreen,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                onCodeChanged: (String code) {},

                onSubmit: (String verificationCode) async {
                  var dataas = {"userDetails": data, "otp": verificationCode};
                  await httpService.otpPost(dataas, "verifyotp");
                }, // end onSubmit
              ),
              SizedBox(
                height: 18.h,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: pureWhite.withOpacity(0.99),
    );
  }

  GoogleSignInAccount? user;
  GoogleSignInApi googleSignInApi = GoogleSignInApi();
  Future googleSignin() async {
    try {
      user = await googleSignInApi.login();
    } on Exception {
      Get.snackbar("Error", "Occured");
    }
    if (user == null) {
      Get.snackbar("Error Occured", "Registration Failed");
    }
  }
}
