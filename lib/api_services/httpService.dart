import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart' as prefix;
import 'package:http/http.dart' as http;
import 'package:jobs_way/constants/constants.dart';
import 'package:jobs_way/model/loginModel.dart';
import 'package:jobs_way/model/otp_model.dart';
import 'package:jobs_way/model/signup.dart';
import 'package:jobs_way/model/signup_model.dart';
import 'package:dio/dio.dart';

class HttpService {
  Dio dio = Dio();

  Welcome usersignup = Welcome();
  Future<Welcome?> signUpPostData(var data, var url) async {
    const base = "https://www.userapi.jobsway.online/api/v1/user/signup";
    const base2 = "https://jobsway-user.herokuapp.com/api/v1/user/signup";

    http.Response response;
    var pathUrl = Uri.parse(base);
    log(data.toString());

    try {
      var response = await http.post(
        pathUrl,
        body: data,
      );
      log("dataaaaaaaa${response.body}");
      if (response.body.contains("errors")) {
        prefix.Get.snackbar(
          "Signup Failed",
          "User Already Exist",
          snackPosition: prefix.SnackPosition.BOTTOM,
        );
      }
      if (response.statusCode == 200) {
        var decoded = json.decode(response.body);
        final map = Welcome.fromJson(decoded);
        return map;
      } else {
        return null;
      }
    } on SocketException {
      log("scene");
      prefix.Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on HttpException catch (e) {
      log(e.message);

      prefix.Get.snackbar(
        "Something Went Wrong",
        "No company found, try agian",
        colorText: primaryGreen,
        
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    }
  }

  Otp otp = Otp();
  Future<Otp?> otpPost(var data, var url) async {
    var pathUrl = Uri.parse(url);
    var json = jsonEncode(data);
    log(json.toString());

    try {
      var response = await http.post(
        pathUrl,
        body: json,
      );
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        log("success");
        String responseString = response.body;
        return otpFromJson(responseString);
      }
      return otp;
    } on SocketException {
      log("scene");
      prefix.Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on HttpException catch (e) {
      log(e.message);

      prefix.Get.snackbar(
        "Something Went Wrong",
        "No company found, try agian",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on TypeError catch (e) {
      log(e.toString());
    }
  }

  Future<Otp?> otpPostDio(var data, var url) async {
    log(data.toString());

    try {
      var response = await dio.post(
        url,
        data: data,
      );

      if (response.statusCode == 200) {
        log("success");
        String responseString = response.data["userDetails"];
        log(responseString);
      }
      return otp;
    } on SocketException {
      log("scene");
      prefix.Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on DioError catch (e) {
      log(e.message);

      prefix.Get.snackbar(
        "Something Went Wrong",
        "No company found, try agian",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on TypeError catch (e) {
      log(e.toString());
    }
  }

  Future<Otp?> googlePost(var data, var url) async {
    // final base = "https://www.userapi.jobsway.online/api/v1/user/$url";
    final base = "https://jobsway-user.herokuapp.com/api/v1/user/$url";
    var pathUrl = Uri.parse(base);

    try {
      var response = await http.post(
        pathUrl,
        body: data,
      );
      log(response.statusCode.toString());
      log("dataaaaaaaa${response.body}");

      if (response.statusCode == 200) {
        String responseString = response.body;

        if (responseString.contains("errors")) {
          prefix.Get.snackbar("Otp Not Correct", "Otp is wrong");
        } else {
          final result = response.body;
          // var jsondecoded = jsonDecode(response.body);
          return otpFromJson(result);
        }
      }
    } on SocketException {
      log("scene");
      prefix.Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on HttpException catch (e) {
      log(e.message);

      prefix.Get.snackbar(
        "Something Went Wrong",
        "No company found, try agian",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    }
  }

  Future<Otp?> verifyOtp(var data, var url) async {
    final base = "https://jobsway-user.herokuapp.com/api/v1/user/$url";

    http.Response response;
    var pathUrl = Uri.parse(base);

    var encoded = json.encode(data);

    log("88888888888888888888$encoded");
    try {
      var response = await http.post(
        pathUrl,
        body: encoded,
        headers: {"Content-Type": "application/json"},
      );
      log(response.statusCode.toString());
      log("dataaaaaaaa${response.body}");
      if (response.body.contains("errors")) {
        prefix.Get.snackbar("Otp Not Correct", "Otp is wrong");
        return null;
      }

      if (response.statusCode == 200) {
        String responseString = response.body;

        if (responseString.contains("errors")) {
          prefix.Get.snackbar("Otp Not Correct", "Otp is wrong");
        } else {
          final jsondecoded = jsonDecode(response.body);
          return otpFromJson(
            response.body,
          );
        }
      } else {
        return null;
      }
    } on SocketException {
      log("scene");
      prefix.Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on HttpException catch (e) {
      log(e.message);

      prefix.Get.snackbar(
        "Something Went Wrong",
        "No company found, try agian",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    }
  }

  Future<Otp?> postData(var data, var url) async {
    final base = "https://jobsway-user.herokuapp.com/api/v1/user/$url";

    try {
      var response = await dio.post(
        base,
        data: data,
      );

      if (response.statusCode == 200) {
        log("hii");
        log('*******************************${response.data.toString()}');

        // Otp data = map["user"];
        // return data;
        // return response.data;
      }
    } on SocketException {
      log("scene");
      prefix.Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on DioError catch (e) {
      log("eror${e.message}.message");

      prefix.Get.snackbar(
        "Something Went Wrong",
        e.message,
        colorText: primaryGreen,
      snackPosition: prefix.SnackPosition.BOTTOM,
      );
    }
    initializeInterceptors();
  }

  UserLogin userLogin = UserLogin();
  Future<UserLogin?> userlogin(
    var data,
  ) async {
    const base = "https://jobsway-user.herokuapp.com/api/v1/user/signin";
    var pathUrl = Uri.parse(base);

    try {
      var response = await http.post(
        pathUrl,
        body: data,
      );

      if (response.statusCode == 200) {
        log("hii");
        log('*******************************${response.body.toString()}');
        return userLoginFromJson(response.body);
      } else {
        if (response.body.contains("User Not found")) {
          prefix.Get.snackbar(
            "Login Failed",
            "User Not found",
          );
        } else if (response.body.contains("Invalid Password")) {
          prefix.Get.snackbar(
            "Login Failed",
            "Password doesn't matching",
          );
        }
        return null;
      }
    } on SocketException {
      log("scene");
      prefix.Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on DioError catch (e) {
      log("eror${e.message}.message");

      prefix.Get.snackbar(
        "Something Went Wrong",
        e.message,
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    }
    initializeInterceptors();
  }

  initializeInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(onError:
        (DioError error, ErrorInterceptorHandler errorInterceptorHandler) {
      log("errrrrrr${error.message}");
    }, onResponse:
        (response, ResponseInterceptorHandler responseinterceptorHandler) {
      log(response.data);
    }));
  }

  jobApply(FormData data, var jobId) async {
    final base =
        "https://jobsway-user.herokuapp.com/api/v1/user/applyjob/$jobId";

    log(data.files.toString());

    try {
      var response = await dio.post(
        base,
        data: data,
      );

      if (response.statusCode == 200) {
        log("success");
        return true;
      } else {
        return false;
      }
    } on SocketException {
      log("scene");
      prefix.Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on DioError catch (e) {
      log("Error Message${e.message}");

      prefix.Get.snackbar(
        "Something Went Wrong",
        "No company found, try agian",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on TypeError catch (e) {
      log(e.toString());
    }
  }
}
