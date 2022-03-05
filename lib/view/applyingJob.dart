import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_way/api_services/httpService.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:jobs_way/controller/applyJobController/applyjob_controller.dart';
import 'package:jobs_way/view/homepage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:dio/dio.dart' as prefix;
import 'package:http/http.dart' as http;

class ApplyingJob extends StatelessWidget {
  ApplyingJob({Key? key, required this.jobId}) : super(key: key);
  var jobId;
  final formkey = GlobalKey<FormState>();
  HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: SingleChildScrollView(
          child: GetBuilder<ApplyJobController>(
              init: ApplyJobController(),
              builder: (controller) {
                return Form(
                  key: formkey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 90.h,
                      ),
                      Wrap(
                        children: [
                          Text(
                            "Applying for ",
                            style: textStyle(
                              textBlack,
                              24.sp,
                              FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Sr.Web Devoloper",
                            style: textStyle(
                              primaryGreen,
                              24.sp,
                              FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 25.h),
                      GestureDetector(
                        onTap: () {
                          controller.profilePicker();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: controller.file == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.camera_alt_sharp,
                                      color: pureWhite,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                      "Add A Photo",
                                      style: textStyle(
                                        pureWhite,
                                        15.sp,
                                        FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                )
                              : Image.file(
                                  controller.file!,
                                  fit: BoxFit.cover,
                                ),
                          height: 180.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            color: fullBlack,
                            borderRadius: BorderRadius.circular(
                              8.r,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 34.h,
                      ),
                      formField(
                        "First Name",
                        false,
                        TextInputType.name,
                        controller: controller.firstNameController,
                        validator: (val) {
                          if (val == "") {
                            return "This field is required";
                          }
                          if (val.length < 4) {
                            return "Minium 4 characters required";
                          }
                          if (val.length > 18) {
                            return "Maximum 8 characters allowed";
                          }
                        },
                      ),
                      SizedBox(
                        height: 34.h,
                      ),
                      formField(
                        "Last Name",
                        false,
                        TextInputType.name,
                        controller: controller.lastnameController,
                        validator: (val) {
                          if (val == "") {
                            return "This field is required";
                          }
                          if (val.length < 2) {
                            return "Minium 4 characters required";
                          }
                          if (val.length > 18) {
                            return "Maximum 18 characters allowed";
                          }
                        },
                      ),
                      SizedBox(
                        height: 34.h,
                      ),
                      formField(
                        "E-mail",
                        false,
                        TextInputType.emailAddress,
                        controller: controller.emailController,
                        validator: (value) => EmailValidator.validate(value)
                            ? null
                            : "Please enter a valid email",
                      ),
                      SizedBox(
                        height: 34.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: formField(
                              "Years.of.Exp",
                              false,
                              const TextInputType.numberWithOptions(),
                              controller: controller.yearofexpController,
                              validator: (val) {
                                if (val == "") {
                                  return "This field is required";
                                }
                                if (val.length > 2) {
                                  return "Enter a correct year";
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: 34.h,
                          ),
                          Expanded(
                            child: formField(
                              "Portfolio link",
                              false,
                              TextInputType.url,
                              controller: controller.portfoliolinkController,
                              validator: (val) {
                                bool _validURL = Uri.parse(val).isAbsolute;

                                if (val != "") {
                                  if (_validURL != true) {
                                    return "Enter a correct URL";
                                  }
                                }
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 34.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: formField(
                              "Phone",
                              false,
                              TextInputType.phone,
                              controller: controller.phoneController,
                              validator: (val) {
                                if (val == "") {
                                  return "This field is required";
                                }
                                if (val.length != 10) {
                                  return "Enter a correct phone number";
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: 34.w,
                          ),
                          Expanded(
                            child: formField(
                              "Location",
                              false,
                              TextInputType.name,
                              controller: controller.locationController,
                              validator: (val) {
                                if (val == "") {
                                  return "This field is required";
                                }
                                if (val.length < 4) {
                                  return "Minium 4 characters required";
                                }
                                if (val.length > 18) {
                                  return "Maximum 18 characters allowed";
                                }
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 47.h,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () => controller.resumePicker(),
                          child: Container(
                            child: controller.pdf == null
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Upload Resume",
                                        style: textStyle(
                                          HexColor(
                                            "0B0A0A",
                                          ),
                                          15.sp,
                                          FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6.w,
                                      ),
                                      Icon(
                                        Icons.upload_file,
                                        color: fullBlack,
                                      )
                                    ],
                                  )
                                : Icon(
                                    Icons.cloud_done,
                                    size: 30,
                                    color: primaryGreen,
                                  ),
                            width: 180.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: quatesText,
                              borderRadius: BorderRadius.circular(
                                8.r,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Wrap(
                        children: [
                          Text(
                            "Don’t have one? No worries Create a ",
                            style: textStyle(
                              textBlack,
                              14.sp,
                              FontWeight.normal,
                            ),
                          ),
                          Text(
                            "JobsWay Resume",
                            style: textStyle(
                                primaryGreen,
                                14.sp,
                                FontWeight.bold,
                                TextDecoration.underline,
                                primaryGreen,
                                TextDecorationStyle.wavy),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            if (formkey.currentState!.validate()) {
                              if (controller.path == null) {
                                Get.snackbar(
                                  "No Image Selected",
                                  "Please select a Image",
                                );
                              } else if (controller.pdfPath == null) {
                                Get.snackbar(
                                  "No Resume Added",
                                  "Please Upload an resume",
                                );
                              } else {
                                List<int> imageBytes =
                                    controller.file!.readAsBytesSync();
                                String base64Image = base64Encode(imageBytes);
                                String fileExtension = controller.path
                                    .split('/')
                                    .last
                                    .split('.')
                                    .last;
                                var data = prefix.FormData.fromMap({
                                  "firstName":
                                      controller.firstNameController.text,
                                  "email": controller.emailController.text,
                                  "location":
                                      controller.locationController.text,
                                  "lastName":
                                      controller.lastnameController.text,
                                  "phone": controller.phoneController.text,
                                  "experience":
                                      controller.yearofexpController.text,
                                  "portfolio":
                                      controller.portfoliolinkController.text,
                                  "image":
                                      'data:image/$fileExtension;base64,$base64Image',
                                  "userId": controller.result[2],
                                  "jobId": jobId,
                                  "pdf": await prefix.MultipartFile.fromFile(
                                      controller.pdfPath,
                                      filename: controller.basenamepdf),
                                });
                                var response =await
                                    httpService.jobApply(data, jobId);
                                if (response == true) {
                                  controller.firstNameController.clear();
                                  controller.lastnameController.clear();
                                  controller.emailController.clear();
                                  controller.yearofexpController.clear();
                                  controller.portfoliolinkController.clear();
                                  controller.phoneController.clear();
                                  controller.locationController.clear();
                                  controller.file = null;
                                  controller.pdfPath = null;

                                  Get.to(
                                    () => const Home(),
                                  );
                                } else {
                                  Get.snackbar("Please try again",
                                      "Something went wrong");
                                }
                              }
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Confirm Application',
                              style: textStyle(
                                pureWhite,
                                20.sp,
                                FontWeight.w800,
                              ),
                            ),
                            width: 312.w,
                            height: 58.h,
                            decoration: BoxDecoration(
                              color: primaryGreen,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    ));
  }
}
