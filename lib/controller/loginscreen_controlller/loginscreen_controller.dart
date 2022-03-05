import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_way/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
    bool eyesOpen = true;

    eye() {
    return GestureDetector(
      onTap: () {
        if (eyesOpen == false) {
          eyesOpen = true;
        } else {
          eyesOpen = false;
        }
        update();
      },
      child: FaIcon(
        eyesOpen == false ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
        color: primaryGreen,
      ),
    );
  }
}
