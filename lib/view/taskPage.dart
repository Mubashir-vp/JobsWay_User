import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:fitted_text_field_container/fitted_text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobs_way/view/homepage.dart';

import 'applyingJob.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController txt = TextEditingController();
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 13.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: CircularCountDownTimer(
                    onComplete:() => Get.to(()=>const Home()),
                    duration: 18000,
                    initialDuration: 0,
                    controller: CountDownController(),
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2,
                    ringColor: (quatesText),
                    ringGradient: null,
                    fillColor: (primaryGreen),
                    fillGradient: null,
                    backgroundColor: pureWhite,
                    backgroundGradient: null,
                    strokeWidth: 20.0.w,
                    strokeCap: StrokeCap.square,
                    textStyle: textStyle(
                      textBlack,
                      33.0.sp,
                      FontWeight.bold,
                    ),
                    textFormat: CountdownTextFormat.HH_MM_SS,
                    isReverse: true,
                    isReverseAnimation: true,
                    isTimerTextShown: true,
                    autoStart: true,
                    onStart: () {
                      print('Countdown Started');
                    },
                   
                  ),
                ),
                questions(
                  "1. How Javascript works ? ",
                ),
                const SizedBox(
                  height: 20,
                ),
                questions(
                  "2. What is the difference between nullvalue and undefined value?",
                ),
                const SizedBox(
                  height: 20,
                ),
                questions(
                  "3. Provide a basic overview of push technology. What are its benefits and drawbacks?",
                ),
                const SizedBox(
                  height: 20,
                ),
                questions(
                  "4. Prepare an login page by managing session and put the link",
                ),
                const SizedBox(
                  height: 36,
                ),
                Text(
                  "Upload the link before the timer ends.",
                  style: textStyle(
                    textBlack,
                    21.sp,
                    FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 100.w,
                    ),
                    Expanded(
                      child: formField(
                        "Copy Link Here",
                        width: 80.w,
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => Get.to(() => const ApplyingJob()),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Submit task',
                        style: textStyle(
                          pureWhite,
                          20.sp,
                          FontWeight.w600,
                        ),
                      ),
                      width: 260.w,
                      height: 58.h,
                      decoration: BoxDecoration(
                        color: HexColor("#00B512"),
                        borderRadius: BorderRadius.circular(
                          10.r,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
              ],
            )),
      ),
    ));
  }
}
