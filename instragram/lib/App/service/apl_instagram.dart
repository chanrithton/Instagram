import 'package:dio/dio.dart';
import 'dart:io';

import 'package:flutter/material.dart';

class ApiInstragram {
  final dio = Dio();
  // create base UrL
  String baseUrl = "http://localhost:8000/api";

  // create Register api
  Future<String> registerUser({
    required String name,
    required String email,
    required String password,
    // ignore: non_constant_identifier_names
    required File? profile_url,
  }) async {
    var formData = FormData.fromMap({
      "name": name,
      "email": email,
      "password": password,
      "password_comfirmation": password,
      "profile_url": profile_url != null
          ? await MultipartFile.fromFile(profile_url.path)
          : null,
    });
    // await dio.post("$baseUrl/auth/register", data: _formData);
    final response = await dio.post(
      "$baseUrl/auth/register",
      data: formData,
      options: Options(
          headers: {
            "Accept": "application/json",
            //  "Content-Type": "multipart/form-data"
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
    debugPrint(response.data);
    if (response.statusCode == 200) {
      return response.data["message"];
    } else {
      throw Exception("Failed to register user");
    }
  }
}
