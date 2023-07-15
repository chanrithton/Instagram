import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

// Make class
class RegisterController extends GetxController {
  final _imagePicker = ImagePicker();
  // convert photo to file
  File? photoProfile;

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
}
