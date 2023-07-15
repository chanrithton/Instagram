import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instragram/App/screens/registerscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // ignore: sized_box_for_whitespace
        child: Container(
          // add gradient background
          height: Get.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.blueGrey],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Spacer(),
                  SizedBox(
                    height: Get.height * 0.10,
                  ),
                  const Text(
                    "WELCOME INSTAGRAM",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Comic Sans MS'),
                  ),
                  const Text(
                    "Please Login",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Comic Sans MS'),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Email',
                            style: TextStyle(fontFamily: 'Comic Sans MS'),
                          ),
                        ),
                        TextFormField(
                          style: const TextStyle(
                              fontSize: 12, fontFamily: 'Comic Sans MS'),
                          decoration: InputDecoration(
                              hintText: 'Phone number,username or email',
                              prefixIcon: const Icon(Icons.email_outlined),
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
                              onPressed: () {},
                              child: const Text(
                                "Login",
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
                          "Don't have an account?",
                          style: TextStyle(
                              fontSize: 15, fontFamily: 'Comic Sans MS'),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(() => const RegisterScreen());
                            },
                            child: const Text(
                              "Sign Up",
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
      ),
    );
  }
}
