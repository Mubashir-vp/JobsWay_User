import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobs_way/constants/packages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_way/controller/userDetailsAdd/userDetails_controller.dart';
import 'package:jobs_way/view/companyDetails.dart';
import 'package:jobs_way/view/jobdetails.dart';
import 'package:get/get.dart';
import 'package:jobs_way/view/taskPage.dart';

final primaryGreen = HexColor("#008FAE");
final subtextBlack = HexColor("#575757");
final textBlack = HexColor("#403A3A");
final fullBlack = HexColor("#000000");
final quatesText = HexColor("#C6C6C6");
final pureWhite = HexColor("#FFFFFF");
final detailsController = Get.put(UserDetailsController());

textStyle(var color, var size, var weight,
    [var decoration, var deccolor, var decstyle]) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: weight,
      decoration: decoration,
      decorationColor: deccolor,
      decorationStyle: decstyle,
    ),
  );
}

formField(
  var hint,
  var obsecure,
  var keyboardtype, {
  var suffix,
  var width,
  var height,
  padding,
  var controller,
  var validator,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: TextFormField(
      keyboardType: keyboardtype,
      textInputAction: TextInputAction.next,
      obscureText: obsecure,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: suffix,
        ),
        contentPadding: padding,
        filled: true,
        fillColor: HexColor(
          "#E5E4E4",
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            10.r,
          ),
        ),
        hintText: hint,
        hintStyle: textStyle(
          HexColor(
            "0B0A0A",
          ),
          11.sp,
          FontWeight.normal,
        ),
      ),
    ),
  );
}

searchformField(var hint, [var width]) {
  return SizedBox(
    width: 407.w,
    height: 48.h,
    child: TextFormField(
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              primaryGreen,
            ),
          ),
          onPressed: () {},
          child: Icon(
            Icons.search,
            color: pureWhite,
          ),
        ),
        suffixIconColor: primaryGreen,
        filled: true,
        fillColor: HexColor(
          "#E5E4E4",
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            10.r,
          ),
        ),
        label: hint,
        hintStyle: textStyle(
          HexColor(
            "#C6C6C6",
          ),
          15.sp,
          FontWeight.normal,
        ),
      ),
    ),
  );
}

findJobssearchformField(var hint, var icon, [var width]) {
  return TextFormField(
    decoration: InputDecoration(
      suffixIcon: Icon(
        icon,
        size: 14,
      ),
      suffixIconColor: textBlack,
      focusColor: primaryGreen,
      filled: true,
      fillColor: HexColor(
        "#E5E4E4",
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(
          10.r,
        ),
      ),
      hintText: hint,
      hintStyle: textStyle(
        textBlack,
        11.sp,
        FontWeight.normal,
      ),
    ),
  );
}

jobCards({
  required var logo,
  required var companyName,
  required var location,
  required var createdDat,
  required var jobTitle,
  required var salary,
  required var timeschedule,
  required var jobID,
}) {
  return Container(
    height: 220.h,
    width: 400.w,
    decoration: BoxDecoration(
      color: fullBlack,
      borderRadius: BorderRadius.circular(
        10.r,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 19.h,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                  child: SizedBox(
                    height: 50.h,
                    width: 55.w,
                    child: Image.network(
                      logo,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 13.w,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200.w,
                                child: Text(
                                  companyName,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: textStyle(
                                    pureWhite,
                                    25.sp,
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                              Wrap(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.mapMarkerAlt,
                                    size: 11,
                                    color: quatesText,
                                  ),
                                  SizedBox(
                                    width: 8.h,
                                  ),
                                  Text(
                                    location,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: textStyle(
                                      quatesText,
                                      11.sp,
                                      FontWeight.normal,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Text(
                            createdDat.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: textStyle(
                              quatesText,
                              11.sp,
                              FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 350.w,
                child: Text(
                  jobTitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: textStyle(
                    pureWhite,
                    25.sp,
                    FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 190.w,
                child: Text(
                  salary,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: textStyle(
                    HexColor(
                      "#00B512",
                    ),
                    20.sp,
                    FontWeight.w700,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  timeschedule.toString(),
                  style: textStyle(
                    pureWhite,
                    14.sp,
                    FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => JobDetails(
                          jobId: jobID,
                          companyLocation: location,
                          companyLogo: logo,
                          companyName: companyName,
                        ));
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Know More",
                        style: textStyle(
                          primaryGreen,
                          12.sp,
                          FontWeight.bold,
                        ),
                      ),
                    ),
                    height: 28.h,
                    width: 102.w,
                    decoration: BoxDecoration(
                      color: pureWhite,
                      borderRadius: BorderRadius.circular(
                        7.r,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

jobCard() {
  return Container(
    height: 220.h,
    width: 400.w,
    decoration: BoxDecoration(
      color: fullBlack,
      borderRadius: BorderRadius.circular(
        10.r,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 19.h,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                  child: SizedBox(
                    height: 50.h,
                    width: 55.w,
                    child: Image.asset(
                      "assets/985_google_g_icon.jpg",
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 13.w,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200.w,
                                child: Text(
                                  'MicroSoft',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: textStyle(
                                    pureWhite,
                                    25.sp,
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                              Wrap(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.mapMarkerAlt,
                                    size: 11,
                                    color: quatesText,
                                  ),
                                  SizedBox(
                                    width: 8.h,
                                  ),
                                  Text(
                                    'Bengaluru, India',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: textStyle(
                                      quatesText,
                                      11.sp,
                                      FontWeight.normal,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Text(
                            "20 days ago",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: textStyle(
                              quatesText,
                              11.sp,
                              FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 350.w,
                child: Text(
                  "Sr.Web developer ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: textStyle(
                    pureWhite,
                    25.sp,
                    FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 190.w,
                child: Text(
                  '₹ 30000 - 50000',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: textStyle(
                    HexColor(
                      "#00B512",
                    ),
                    20.sp,
                    FontWeight.w700,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Full time',
                  style: textStyle(
                    pureWhite,
                    14.sp,
                    FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Get.to(() =>  JobDetails());
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Know More",
                        style: textStyle(
                          primaryGreen,
                          12.sp,
                          FontWeight.bold,
                        ),
                      ),
                    ),
                    height: 28.h,
                    width: 102.w,
                    decoration: BoxDecoration(
                      color: pureWhite,
                      borderRadius: BorderRadius.circular(
                        7.r,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

companyCard({
  var color,
  var shadow,
  required var logo,
  required var name,
  required var location,
}) {
  return GestureDetector(
    // onTap: () => Get.to(() => const CompanyDetails()),
    child: Container(
      height: 125.h,
      width: 140.82.w,
      decoration: BoxDecoration(
        boxShadow: shadow,
        borderRadius: BorderRadius.circular(
          10.r,
        ),
        color: color,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                10.r,
              ),
              child: SizedBox(
                height: 43.h,
                width: 43.w,
                child: Image.network(
                  logo,
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              width: 80.w,
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
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
                  FontAwesomeIcons.mapMarkerAlt,
                  size: 11,
                  color: textBlack,
                ),
                SizedBox(
                  width: 3.h,
                ),
                SizedBox(
                  width: 76.w,
                  child: Text(
                    location,
                    overflow: TextOverflow.ellipsis,
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
}

jobCardList(var card, var direction, {var height, var width}) {
  return ListView.separated(
      scrollDirection: direction,
      itemBuilder: (BuildContext context, index) {
        return card;
      },
      separatorBuilder: (
        BuildContext context,
        index,
      ) =>
          SizedBox(
            height: height,
            width: width,
          ),
      itemCount: 10);
}

companyList() {
  return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, index) {
        return companyCard(
            color: HexColor(
              "#E5E4E4",
            ),
            location: "Banglur",
            name: "Google",
            logo: "assets/985_google_g_icon.jpg");
      },
      separatorBuilder: (
        BuildContext context,
        index,
      ) =>
          SizedBox(
            width: 24.w,
          ),
      itemCount: 10);
}

jobGrid() {
  GridView.builder(
      itemCount: 6,
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 9.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        return companyCard(
          color: quatesText,
          location: "kochi",
          logo: "assets/985_google_g_icon.jpg",
          name: "google",
        );
      });
}

qualifications({required String text}) {
  return Text(
    "•   $text,",
    style: textStyle(
      fullBlack,
      14.sp,
      FontWeight.w300,
    ),
  );
}

// sizer([var height, var width]) {
//   return SizedBox(
//     height: height.h,
//     width: width.w,
//   );
// }
growableSkillCard() {
  return Row(
    children: [
      formField(
        "Skill",
        false,
        TextInputType.name,
        width: 130.w,
      ),
      SizedBox(
        width: 10.w,
      )
    ],
  );
}

growableForm() {
  return Column(
    children: [
      SizedBox(
        width: 400.0.w,
        height: 140.h,
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 130),
            filled: true,
            fillColor: HexColor(
              "#E5E4E4",
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                10.r,
              ),
            ),
            hintText: "Describe Your Experience",
            hintStyle: textStyle(
              HexColor(
                "0B0A0A",
              ),
              15.sp,
              FontWeight.normal,
            ),
          ),
        ),
      ),
      SizedBox(
        height: detailsController.count == 1 ? 0 : 18.h,
      )
    ],
  );
}

taskCard() {
  return Container(
    height: 260.h,
    width: 400.w,
    decoration: BoxDecoration(
      color: fullBlack,
      borderRadius: BorderRadius.circular(
        10.r,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 19.h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                  child: SizedBox(
                    height: 50.h,
                    width: 55.w,
                    child: Image.asset(
                      "assets/985_google_g_icon.jpg",
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 26.w,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200.w,
                                child: Text(
                                  'MicroSoft',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: textStyle(
                                    pureWhite,
                                    25.sp,
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                              Wrap(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.mapMarkerAlt,
                                    size: 11,
                                    color: quatesText,
                                  ),
                                  SizedBox(
                                    width: 8.h,
                                  ),
                                  Text(
                                    'Bengaluru, India',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: textStyle(
                                      quatesText,
                                      11.sp,
                                      FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Complete Task ",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: textStyle(
                                  pureWhite,
                                  20.sp,
                                  FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 30.0.w, top: 13.h),
                                child: Text(
                                  "Questions   : 4",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: textStyle(
                                    pureWhite,
                                    16.sp,
                                    FontWeight.normal,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 30.0.w, top: 7.h),
                                child: Text(
                                  "Time   : 40 minutes",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: textStyle(
                                    pureWhite,
                                    16.sp,
                                    FontWeight.normal,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => const TaskPage());
                },
                child: Container(
                  child: Center(
                    child: Text(
                      "Start Task",
                      style: textStyle(
                        pureWhite,
                        12.sp,
                        FontWeight.bold,
                      ),
                    ),
                  ),
                  height: 34.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.circular(
                      7.r,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

jobStatusContainer(var buttonColor, var textColor, var text) {
  return Container(
    width: 410.w,
    height: 80.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        10.r,
      ),
      color: fullBlack,
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              15.r,
            ),
            child: SizedBox(
              height: 50.h,
              width: 55.w,
              child: Image.asset(
                "assets/985_google_g_icon.jpg",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 11.0.w,
            ),
            child: SizedBox(
              width: 220,
              child: Text(
                "Sr.Software Developer",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: textStyle(
                  pureWhite,
                  20.sp,
                  FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                text,
                style: textStyle(
                  HexColor(
                    textColor,
                  ),
                  12.sp,
                  FontWeight.bold,
                ),
              ),
            ),
            height: 34.h,
            width: 70.w,
            decoration: BoxDecoration(
              color: HexColor(
                buttonColor,
              ),
              borderRadius: BorderRadius.circular(
                5.r,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

questions(var text) {
  return Text(
    text,
    style: textStyle(
      textBlack,
      20.sp,
      FontWeight.w400,
    ),
  );
}
