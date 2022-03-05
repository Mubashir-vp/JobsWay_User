import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_way/api_services/getservices.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobs_way/model/jobsDetails.dart';
import 'package:jobs_way/view/applyingJob.dart';
import 'package:get/get.dart';

class JobDetails extends StatelessWidget {
  JobDetails({
    Key? key,
    required this.jobId,
    required this.companyLocation,
    required this.companyLogo,
    required this.companyName,
  }) : super(key: key);
  var jobId;
  var companyName;
  var companyLogo;
  var companyLocation;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 13.h,
          ),
          child: SingleChildScrollView(
            child: FutureBuilder(
                future: GetSerivces().jobDetails(
                  jobId: jobId,
                ),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<JobsbyId?> snapshot,
                ) {
                  if (snapshot.hasData) {
                    print(snapshot.data!.toString());
                    var applicants = snapshot.data!.applications == null
                        ? "0"
                        : snapshot.data!.applications!.length;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 52.h,
                        ),
                        Center(
                          child: companyCard(
                            color: pureWhite,
                            shadow: [
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
                            ],
                            location: companyLocation,
                            logo: companyLogo,
                            name: companyName,
                          ),
                        ),
                        SizedBox(
                          height: 59.h,
                        ),
                        Text(
                          "Experience                 :  ${snapshot.data!.minExp} - ${snapshot.data!.maxExp} years",
                          style: textStyle(
                            fullBlack,
                            15.sp,
                            FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          "Posted Date              :  ${snapshot.data!.createdDate!.day} - ${snapshot.data!.createdDate!.month} - ${snapshot.data!.createdDate!.year}",
                          style: textStyle(
                            fullBlack,
                            15.sp,
                            FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          "No.of.Applicants     :  $applicants",
                          style: textStyle(
                            fullBlack,
                            15.sp,
                            FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 41.h,
                        ),
                        Text(
                          snapshot.data!.jobTitle!,
                          style: textStyle(
                            textBlack,
                            40.sp,
                            FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 300.w,
                              child: Text(
                                '₹ ${snapshot.data!.minSalary} - ${snapshot.data!.maxSalary}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: textStyle(
                                  HexColor(
                                    "#00B512",
                                  ),
                                  29.sp,
                                  FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Expanded(
                              child: Text(
                                snapshot.data!.timeSchedule!,
                                style: textStyle(
                                  textBlack,
                                  14.sp,
                                  FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Qualifications :   ",
                              style: textStyle(
                                textBlack,
                                20.sp,
                                FontWeight.w500,
                              ),

                            ),
                        //       SizedBox(
                        //   height: 6.h,
                        // ),
                        SizedBox(
                          width: width/1.8,
                          height: 80.h,
                          child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              itemBuilder: ((context, index) {
                                return Text(
                                  snapshot.data!.qualification![index],
                                  style: textStyle(
                                    fullBlack,
                                    14.sp,
                                    FontWeight.w500,
                                  ),
                                );
                              }),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 10.h,
                                  ),
                              itemCount: snapshot.data!.qualification!.length),
                        ),
                          ],
                        ),
                      
                        Row(    
                          children: [
                            Text(
                              'Education    :   ',
                              style: textStyle(
                                fullBlack,
                                15.sp,
                                FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: width/1.5,
                              height: 18.h,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Text(
                                        "${snapshot.data!.education![index]},",
                                        style: textStyle(
                                    fullBlack,
                                    14.sp,
                                    FontWeight.w500,
                                  ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                  itemCount: snapshot.data!.education!.length),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Languages     :   ',
                              style: textStyle(
                                fullBlack,
                                15.sp,
                                FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: width/1.6,
                              height: 20.h,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Text(
                                      "${snapshot.data!.language![index]},",
                                      style: textStyle(
                                    fullBlack,
                                    14.sp,
                                    FontWeight.w500,
                                  ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                  itemCount: snapshot.data!.language!.length),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 44.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Skills     :",
                              style: textStyle(
                                fullBlack,
                                15.sp,
                                FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 23.w,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                child: GridView.builder(
                                    itemCount: snapshot.data!.skills!.length,
                                    scrollDirection: Axis.horizontal,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 9.0,
                                      mainAxisSpacing: 10.0,
                                    ),
                                    itemBuilder: (context, index) {
                                      var text = snapshot.data!.skills![index];
                                      return Container(
                                        child: Center(
                                          child: Text(
                                            text,
                                            style: textStyle(
                                              pureWhite,
                                              14.sp,
                                              FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        height: 100.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                          color: primaryGreen,
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () => Get.to(() =>  ApplyingJob(
                              jobId: snapshot.data!.id,
                            )),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Apply Now',
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
                          height: 52.h,
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }
}
