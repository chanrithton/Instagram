import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:instragram/App/service/apl_instagram.dart';

// Make class
class RegisterController extends GetxController {
  final _imagePicker = ImagePicker();
  // convert photo to file
  File? photoProfile;

  // make class
  final _apihelper = ApiInstragram();

  // create a method to select photo profile from gallery
  void selectPhotoProfile() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      photoProfile = File(pickedFile.path);
      update();
      debugPrint("photo profile selected");
    } else {
      debugPrint("no photo profile selected");
    }
  }

  // Api register user
  void register({
    required String name,
    required String email,
    required String password,
    // ignore: non_constant_identifier_names
    required File? profile_url,
  }) async {
    try {
      await _apihelper.registerUser(
          name: name,
          email: email,
          password: password,
          profile_url: profile_url);
      Get.back(result: true); // show message
    } catch (e) {
      Get.snackbar("Error", e.toString());
      debugPrint(e as String?);
    }
  }
}
