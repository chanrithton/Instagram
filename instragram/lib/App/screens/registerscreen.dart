// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instragram/App/controllers/register_controller.dart';
import 'package:instragram/App/screens/loginscreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final controller = Get.put(RegisterController());
  bool hidePassword = true; // eye password
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          // add gradient background
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.blueGrey],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const Spacer(),
                // add wiget to select photo
                GetBuilder<RegisterController>(builder: (context) {
                  return Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 200,
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white,
                              border: Border.all(color: Colors.white, width: 3),
                              image: controller.photoProfile == null
                                  ? const DecorationImage(
                                      image: NetworkImage(
                                          'https://cdn-icons-png.flaticon.com/512/2815/2815428.png'),
                                      fit: BoxFit.cover,
                                    )
                                  : DecorationImage(
                                      image:
                                          FileImage(controller.photoProfile!),
                                      fit: BoxFit.cover)),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        bottom: 10,
                        child: GestureDetector(
                          onTap: () async {
                            controller.selectPhotoProfile();
                            setState(() {});
                            // debugPrint("select photo");
                          },
                          child: const CircleAvatar(
                            child: Icon(
                              Icons.camera_alt,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Mobile Phone or Email',
                          style: TextStyle(fontFamily: 'Comic Sans MS'),
                        ),
                      ),
                      TextFormField(
                        style: const TextStyle(
                            fontSize: 12, fontFamily: 'Comic Sans MS'),
                        decoration: InputDecoration(
                            hintText: 'Mobile Phone or Email',
                            prefixIcon: const Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Full Name',
                          style: TextStyle(fontFamily: 'Comic Sans MS'),
                        ),
                      ),
                      TextFormField(
                        style: const TextStyle(
                            fontSize: 12, fontFamily: 'Comic Sans MS'),
                        decoration: InputDecoration(
                            hintText: 'Full Name',
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * 0.01),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Password',
                          style: TextStyle(fontFamily: 'Comic Sans MS'),
                        ),
                      ),
                      TextField(
                        style: const TextStyle(
                            fontSize: 12, fontFamily: 'Comic Sans MS'),
                        onChanged: (value) {
                          debugPrint(value);
                        },
                        obscureText: hidePassword, //show/hide password
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: hidePassword
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                12), //circular border for TextField.
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.width * 0.03),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => const LoginScreen());
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(fontFamily: 'Comic Sans MS'),
                            )))
                  ],
                ),
                SizedBox(height: Get.height * 0.02),
                // add divider and or text center
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      "OR",
                      style: TextStyle(fontFamily: 'Comic Sans MS'),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                // add textbutton for register
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontSize: 15, fontFamily: 'Comic Sans MS'),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(() => const LoginScreen());
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.blue,
                                fontFamily: 'Comic Sans MS'),
                          ))
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
