import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplyJobController extends GetxController {
  File? file;
  var path;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    sharedPreference = await SharedPreferences.getInstance();
    datasFetching();
    log(result.toString());
  }

  var sharedPreference;

  Future profilePicker() async {
    final image = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);
    if (image == null) return;
    path = image.files.single.path;
    update();
    file = File(path!);
    update();
  }

  File? pdf;
  String? basenamepdf;
  var pdfPath;
  Future resumePicker() async {
    final file = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.any);
    if (file == null) return;

    pdfPath = file.files.single.path;
    update();
    pdf = File(pdfPath!);
    basenamepdf = basename(pdf!.path);
    update();
  }

  var result;

  List<String> datasFetching() {
    result = sharedPreference.getStringList("sharedList");
    log(result![0]);
    return result;
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController yearofexpController = TextEditingController();
  TextEditingController portfoliolinkController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
}
