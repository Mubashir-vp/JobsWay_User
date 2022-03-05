import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jobs_way/view/applyingJob.dart';
import 'package:jobs_way/view/companyDetails.dart';
import 'package:jobs_way/view/createResume.dart';
import 'package:jobs_way/view/findJobs.dart';
import 'package:jobs_way/view/homepage.dart';
import 'package:jobs_way/view/jobdetails.dart';
import 'package:jobs_way/view/login.dart';
import 'package:jobs_way/view/myjobs.dart';
import 'package:jobs_way/view/profile.dart';
import 'package:jobs_way/view/signup.dart';
import 'package:jobs_way/view/taskPage.dart';
import 'package:jobs_way/view/user_profileDetailsAdd.dart';
import 'view/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize:const Size(428, 926),
      builder: () {
        
        return const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen());
      }
    ));
    // HttpOverrides.global = MyHttpOverrides();

}
//  class MyHttpOverrides extends HttpOverrides{
//   @override
//   HttpClient createHttpClient(SecurityContext? context){
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
//   }
// }

