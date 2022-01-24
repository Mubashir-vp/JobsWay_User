import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_way/constants/constants.dart';

class UserDetailsController extends GetxController {
   int count = 1;

   
  addButton() {
    return IconButton(
      onPressed: () {
        count = count + 1;
        print(count);
        update();
      },
      icon: const Icon(
        Icons.add,
      ),
    );
  }
}
