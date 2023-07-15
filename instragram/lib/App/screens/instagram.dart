import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instragram/App/controllers/register_controller.dart';

class Instagram extends StatefulWidget {
  const Instagram({super.key});

  @override
  State<Instagram> createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> {
  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Instagram",
          style: TextStyle(color: Colors.black, fontFamily: 'Comic Sans MS'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                debugPrint("I love you");
              },
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                debugPrint("I love you");
              },
              icon: const Icon(
                Icons.messenger_outline_outlined,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
