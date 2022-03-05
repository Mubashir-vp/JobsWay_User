import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobs_way/api_services/getservices.dart';
import 'package:jobs_way/api_services/googlesignin_api.dart';
import 'package:jobs_way/api_services/httpService.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:jobs_way/controller/home_screen_controller/home_controller.dart';
import 'package:jobs_way/controller/signup_controller/signup_controller.dart';
import 'package:jobs_way/model/topCompanies_model.dart';
import 'package:jobs_way/view/createResume.dart';
import 'package:jobs_way/view/login.dart';
import 'package:jobs_way/view/myjobs.dart';
import 'package:jobs_way/view/profile.dart';
import 'package:jobs_way/view/signup.dart';

import 'companyDetails.dart';
import 'findJobs.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var signupController = Get.put(SignUpController());
    GoogleSignInApi googleSignInApi = GoogleSignInApi();
    return SafeArea(
        child: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) {
              return Scaffold(
                backgroundColor: pureWhite,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(100.0.h),
                  child: AppBar(
                    elevation: 0,
                    backgroundColor: pureWhite,
                    actions: [
                      Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: PopupMenuButton(
                              icon: FaIcon(
                                FontAwesomeIcons.userCircle,
                                color: primaryGreen,
                              ),
                              itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: GestureDetector(
                                        onTap: () => Get.to(const Profile()),
                                        child: Row(
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.addressCard,
                                              color: fullBlack,
                                            ),
                                            SizedBox(
                                              width: 11.w,
                                            ),
                                            Text(
                                              "Profile",
                                              style: textStyle(
                                                textBlack,
                                                20.sp,
                                                FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      value: 1,
                                    ),
                                    PopupMenuItem(
                                      child: GestureDetector(
                                        onTap: () => Get.to(
                                          () => const MyJobs(),
                                        ),
                                        child: Row(
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.heart,
                                              color: fullBlack,
                                            ),
                                            SizedBox(
                                              width: 11.w,
                                            ),
                                            Text(
                                              "My Jobs",
                                              style: textStyle(
                                                textBlack,
                                                20.sp,
                                                FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      value: 2,
                                    ),
                                    PopupMenuItem(
                                      child: GestureDetector(
                                        onTap: () {
                                          if (controller.mode == "phone") {
                                            signupController
                                                .loginfalseFunction();
                                            Get.to(
                                              () => const LoginPage(),
                                            );
                                          } else {
                                            signupController
                                                .loginfalseFunction();
                                            Get.to(
                                              () => const LoginPage(),
                                            );
                                            googleSignInApi.logout();
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.signOutAlt,
                                              color: fullBlack,
                                            ),
                                            SizedBox(
                                              width: 11.w,
                                            ),
                                            Text(
                                              "Sign Out",
                                              style: textStyle(
                                                textBlack,
                                                20.sp,
                                                FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      value: 3,
                                    ),
                                  ])),
                    ],
                    title: Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.to(() => const FindJobs());
                            },
                            child: Text(
                              'Find Jobs',
                              style: textStyle(
                                primaryGreen,
                                15.0.sp,
                                FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(() => const CreateResume());
                            },
                            child: Text(
                              'Create Resume',
                              style: textStyle(
                                primaryGreen,
                                15.0.sp,
                                FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 13.w,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 70.h,
                          ),
                          Wrap(
                            children: [
                              Text(
                                "Get the",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: textBlack,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 35.sp,
                                  ),
                                ),
                              ),
                              Text(
                                " Right Job",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: primaryGreen,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 35.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "You Deserve",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: textBlack,
                                fontWeight: FontWeight.w700,
                                fontSize: 40.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 22.h,
                          ),
                          Text(
                            "Get new opportunity through JobsWay.",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: quatesText,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 29.h,
                          ),
                          searchformField(
                            const Text(
                              "Search for Job,Companies,categories",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          SizedBox(
                            child: Text(
                              "Top Companies.",
                              style: textStyle(
                                fullBlack,
                                25.sp,
                                FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          SizedBox(
                            height: 280.h,
                            width: MediaQuery.of(context).size.width,
                            child: FutureBuilder(
                                future: GetSerivces().topCompanies(),
                                builder: (
                                  BuildContext context,
                                  AsyncSnapshot<List<Topcompanies?>?> snapshot,
                                ) {
                                  if (snapshot.hasData) {
                                    return GridView.builder(
                                        itemCount: snapshot.data!.length,
                                        scrollDirection: Axis.horizontal,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 9.0,
                                          mainAxisSpacing: 10.0,
                                        ),
                                        itemBuilder: (
                                          context,
                                          index,
                                        ) {
                                          final data = snapshot.data![index];

                                          return GestureDetector(
                                            onTap: () {
                                              int ind = index;
                                              Get.to(
                                                () => CompanyDetails(
                                                  index: ind,
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: 125.h,
                                              width: 140.82.w,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(
                                                      0.1,
                                                    ),
                                                    spreadRadius: 1,
                                                    blurRadius: 20,
                                                    offset: const Offset(
                                                      7,
                                                      5,
                                                    ),
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10.r,
                                                ),
                                                color: pureWhite,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 8.h,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        10.r,
                                                      ),
                                                      child: SizedBox(
                                                        height: 43.h,
                                                        width: 43.w,
                                                        child: Image.network(
                                                          data!.logoUrl!,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    SizedBox(
                                                      width: 80.w,
                                                      child: Text(
                                                        data.companyName!,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: textStyle(
                                                          textBlack,
                                                          15.sp,
                                                          FontWeight.w900,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    Wrap(
                                                      children: [
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .mapMarkerAlt,
                                                          size: 11,
                                                          color: textBlack,
                                                        ),
                                                        SizedBox(
                                                          width: 3.h,
                                                        ),
                                                        SizedBox(
                                                          width: 76.w,
                                                          child: Text(
                                                            data.location!,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            style: textStyle(
                                                              textBlack,
                                                              11.sp,
                                                              FontWeight.bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: primaryGreen,
                                      ),
                                    );
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
