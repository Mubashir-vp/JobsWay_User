import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jobs_way/constants/constants.dart';
import 'package:jobs_way/model/loginModel.dart';
import 'package:jobs_way/model/otp_model.dart';
import 'package:jobs_way/model/signup.dart';
import 'package:jobs_way/model/signup_model.dart';
import 'package:dio/dio.dart';
import 'package:jobs_way/model/topCompanies_model.dart';
import 'package:jobs_way/model/jobsDetails.dart';
import '../model/getJobycompany.dart';

class GetSerivces {
  Dio dio = Dio();

  ///*************************************************************** */
  late List<Topcompanies?> topcompanies;
  Future<List<Topcompanies?>?> topCompanies() async {
    const url = "https://jobsway-user.herokuapp.com/api/v1/user/companies";
    var pathUrl = Uri.parse(url);
    try {
      var response = await http.get(
        pathUrl,
      );
      String responseString = response.body;

      if (responseString.contains("error")) {
        Get.snackbar(
          "Something went wrong",
          "",
        );
      } else {
        if (response.statusCode == 200) {
          String responseString = response.body;
          log("${response.statusCode}");
          return topcompaniesFromJson(responseString);
        }
      }

      return topcompanies;
    } on SocketException {
      log("scene");
      Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: primaryGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
    } on DioError catch (e) {
      log(e.message);

      Get.snackbar(
        "Something Went Wrong",
        "No company found, try agian",
        colorText: primaryGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  ///*************************************************************** */
  late List<Jobnycompanies?> jobnycompanies;
  Future<List<Jobnycompanies?>?> companyBasedJobs({required var cId}) async {
    final url =
        "https://jobsway-user.herokuapp.com/api/v1/user//company-jobs/$cId";
    var pathUrl = Uri.parse(url);
    try {
      var response = await http.get(
        pathUrl,
      );
      log("${response.statusCode}");
      String responseString = response.body;

      if (responseString.contains("error")) {
        Get.snackbar(
          "Something went wrong",
          "",
        );
      }
      // if (response.body.) {
      //   log("null jobs list");
      // }
      else {
        if (response.statusCode == 200) {
          String responseString = response.body;
          log("${response.statusCode}");
          jobnycompanies = jobnycompaniesFromJson(responseString);
          log("message_-_-_-_-${jobnycompanies.isEmpty}");
          if (jobnycompanies.isEmpty) {
            return null;
          } else {
            return jobnycompaniesFromJson(responseString);
          }
        }
      }

      return jobnycompanies;
    } on SocketException {
      log("scene");
      Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: primaryGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
    } on DioError catch (e) {
      log(e.message);

      Get.snackbar(
        "Something Went Wrong",
        "No company found, try agian",
        colorText: primaryGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return null;
  }

  ///*************************************************************** */
  JobsbyId jobsById = JobsbyId();
  Future<JobsbyId?> jobDetails({required var jobId}) async {
    log("job IDdd=$jobId");
    final url =
        "https://jobsway-user.herokuapp.com/api/v1/user/job/details/$jobId";
    var pathUrl = Uri.parse(url);
    try {
      var response = await http.get(
        pathUrl,
      );
      String responseString = response.body;
      if (responseString.contains("error")) {
        Get.snackbar(
          "Something went wrong",
          "",
        );
      }
      else {
        if (response.statusCode == 200) {
          log("${response.statusCode}");
          var decodedResponse = jsonDecode(response.body);
          return jobsbyIdFromJson(response.body);
        }
      }

      return jobsById;
    } on SocketException {
      log("scene");
      Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: primaryGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
    } on DioError catch (e) {
      log(e.message);

      Get.snackbar(
        "Something Went Wrong",
        "No company found, try agian",
        colorText: primaryGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return null;
  }
}
