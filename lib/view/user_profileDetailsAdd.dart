import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:jobs_way/controller/userDetailsAdd/userDetails_controller.dart';
import 'package:get/get.dart';
import 'package:jobs_way/view/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserDetailsAdd extends StatelessWidget {
  const UserDetailsAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: GetBuilder<UserDetailsController>(
              init: UserDetailsController(),
              builder: (controller) {
                List<Widget> contatos = List.generate(
                    controller.count, (int i) => growableSkillCard());
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    SizedBox(height: 25.h),
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
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
                        ),
                        height: 100.h,
                        width: 180.w,
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
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    formField(
                      "Last Name",
                       false,
                            TextInputType.name,
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    formField(
                      "E-mail",
                       false,
                            TextInputType.name,
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
                            TextInputType.name,
                          ),
                        ),
                        SizedBox(
                          width: 34.h,
                        ),
                        Expanded(
                          child: formField(
                            "Portfolio link",
                             false,
                            TextInputType.name,
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
                            TextInputType.name,
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
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 47.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 60.h,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: contatos,
                            ),
                          ),
                        ),
                        controller.addButton(),
                      ],
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: formField("Facebook",
                           false,
                            TextInputType.name,
                              suffix: FaIcon(
                                FontAwesomeIcons.facebook,
                                color: primaryGreen,
                              ),
                              ),
                        ),
                        SizedBox(
                          width: 34.h,
                        ),
                        Expanded(
                          child: formField("Linked In",
                           false,
                            TextInputType.name,
                              suffix: FaIcon(
                                FontAwesomeIcons.linkedin,
                                color: primaryGreen,
                              )),
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
                            "Twitter",
                             false,
                            TextInputType.name,
                            suffix: FaIcon(
                              FontAwesomeIcons.twitter,
                              color: primaryGreen,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 34.w,
                        ),
                        Expanded(
                          child: formField(
                            "Instagram",
                             false,
                            TextInputType.name,
                            suffix: FaIcon(
                              FontAwesomeIcons.instagram,
                              color: primaryGreen,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () => Get.to(() => const Profile()),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Save',
                            style: textStyle(
                              pureWhite,
                              20.sp,
                              FontWeight.w800,
                            ),
                          ),
                          width: 180.w,
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
                      height: 47.h,
                    ),
                  ],
                );
              }),
        ),
      ),
    ));
  }
}
