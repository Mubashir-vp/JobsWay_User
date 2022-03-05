import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_way/api_services/getservices.dart';
import 'package:jobs_way/api_services/httpService.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jobs_way/model/getJobycompany.dart';
import 'package:jobs_way/model/topCompanies_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class CompanyDetails extends StatelessWidget {
  CompanyDetails({Key? key, required this.index}) : super(key: key);
  var index;
  void _launchURL({var url}) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  void _socialMediaUrl({var url}) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
        ),
        child: FutureBuilder(
            future: GetSerivces().topCompanies(),
            builder: (
              context,
              AsyncSnapshot<List<Topcompanies?>?> snapshot,
            ) {
              if (snapshot.hasData) {
                final data = snapshot.data![index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Center(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 11.0.w,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 18.h,
                              ),
                              Center(
                                child: Material(
                                  elevation: 10,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      10.r,
                                    ),
                                    child: SizedBox(
                                      height: 60.h,
                                      width: 60.w,
                                      child: Image.network(
                                        data!.logoUrl!,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 13.h,
                              ),
                              Center(
                                child: Text(
                                  data.companyName!,
                                  style: textStyle(
                                    textBlack,
                                    20.sp,
                                    FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (data.website != null) {
                                    _launchURL(url: data.website);
                                  } else {
                                    return;
                                  }
                                },
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Website     :',
                                    style: textStyle(
                                      fullBlack,
                                      15.sp,
                                      FontWeight.w500,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: data.website != null
                                            ? ' ${data.website}'
                                            : "nill",
                                        style: textStyle(
                                          fullBlack,
                                          15.sp,
                                          FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 26.h,
                              ),
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
                                      text: '  ${data.location}',
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
                                height: 30.h,
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
                                      text: '  ${data.email}',
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
                                height: 30.h,
                              ),
                              Text(
                                'Bio     :',
                                style: textStyle(
                                  fullBlack,
                                  15.sp,
                                  FontWeight.w500,
                                ),
                              ),
                              Text(
                                ' ${data.bio}',
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: textStyle(
                                  fullBlack,
                                  14.sp,
                                  FontWeight.w800,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      if (data.instagram != "") {
                                        _socialMediaUrl(
                                          url:
                                              "https://www.instagram.com/${data.instagram}",
                                        );
                                      } else {
                                        Get.snackbar(
                                          "No Instagram Account Found",
                                          "",
                                          snackPosition: SnackPosition.BOTTOM,
                                          colorText: pureWhite,
                                          backgroundColor: primaryGreen,
                                        );
                                      }
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.instagram,
                                      color: data.instagram != ""
                                          ? primaryGreen
                                          : Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 19.w,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      if (data.instagram != "") {
                                        _socialMediaUrl(
                                          url:
                                              "https://www.facebook.com/${data.facebook}",
                                        );
                                      } else {
                                        Get.snackbar(
                                          "No Facebook Account Found",
                                          "",
                                          snackPosition: SnackPosition.BOTTOM,
                                          colorText: pureWhite,
                                          backgroundColor: primaryGreen,
                                        );
                                      }
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.facebook,
                                      color: data.facebook != ""
                                          ? primaryGreen
                                          : Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 19.w,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      if (data.linkedin != "") {
                                        _socialMediaUrl(
                                          url:
                                              "https://www.linkedin.com/${data.linkedIn}",
                                        );
                                      } else {
                                        Get.snackbar(
                                          "No LinkedIn Account Found",
                                          "",
                                          colorText: pureWhite,
                                          backgroundColor: primaryGreen,
                                          snackPosition: SnackPosition.BOTTOM,
                                        );
                                      }
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.linkedin,
                                      color: data.linkedIn != null
                                          ? primaryGreen
                                          : Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 19.w,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      if (data.twitter != "") {
                                        _socialMediaUrl(
                                          url:
                                              "https://www.twitter.com/${data.twitter}",
                                        );
                                      } else {
                                        Get.snackbar(
                                          "No Twitter Account Found",
                                          "",
                                          snackPosition: SnackPosition.BOTTOM,
                                          colorText: pureWhite,
                                          backgroundColor: primaryGreen,
                                        );
                                      }
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.twitter,
                                      color: data.twitter != null
                                          ? primaryGreen
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
                        height: 500.h,
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Jobs by',
                        style: textStyle(
                          fullBlack,
                          30.sp,
                          FontWeight.w900,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' ${data.companyName}',
                            style: textStyle(
                              primaryGreen,
                              30.sp,
                              FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Expanded(
                        child: FutureBuilder(
                            future: GetSerivces().companyBasedJobs(
                              cId: data.id,
                            ),
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<List<Jobnycompanies?>?> snapshot,
                            ) {
                              if (snapshot.hasData) {
                                return ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (BuildContext context, index) {
                                      final jobData = snapshot.data![index];

                                      return jobCards(
                                        logo: data.logoUrl,
                                        companyName: data.companyName,
                                        location: jobData!.jobLocation,
                                        createdDat: timeago
                                            .format(jobData.createdDate!)
                                            .toUpperCase(),
                                        jobTitle: jobData.jobTitle,
                                        salary:
                                            "${jobData.minSalary}-${jobData.maxSalary}",
                                        timeschedule: jobData.timeSchedule!, jobID: jobData.id,
                                      );
                                    },
                                    separatorBuilder: (
                                      BuildContext context,
                                      index,
                                    ) =>
                                        SizedBox(
                                          width: 17.w,
                                        ),
                                    itemCount: snapshot.data!.length);
                              }
                             else if (snapshot.data == null) {
                                return Center(
                                  child: Text(
                                    "No Jobs !!",
                                    style: textStyle(
                                      primaryGreen,
                                      20.sp,
                                      FontWeight.w600,
                                    ),
                                  ),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: primaryGreen,
                                  ),
                                );
                              }
                            })),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: primaryGreen,
                  ),
                );
              }
            }),
      ),
    ));
  }
}
