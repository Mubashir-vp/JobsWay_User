import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();

//  static Future login()async {
//     try {
//       _googleSignIn.signIn();
//     } on PlatformException catch (e) {
//       Get.snackbar("Registraion Failed", "Please Login again");
//     }
//   }

  Future<GoogleSignInAccount?> login() async {
    try {
      return _googleSignIn.signIn();
    } on PlatformException catch (e) {
      Get.snackbar("$e", "Error Occured");
    } on Error catch (e) {
      Get.snackbar("$e", "Error Occured");
    }
  }
  // static Future<GoogleSignInAccount?> handleSignIn() async {
  //   try {
  //     await _googleSignIn.signIn();
  //   } on PlatformException catch (error) {
  //     print(error);
  //     Get.snackbar("SignUp failed ", "SignUp failed, try again later");
  //   }
  // }

  Future logout() async {
    try {
      _googleSignIn.disconnect();
    } on PlatformException {
      Get.snackbar("Error ", "Bad request");
    }
  }
}
