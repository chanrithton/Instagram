import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:instragram/App/screens/loginscreen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
