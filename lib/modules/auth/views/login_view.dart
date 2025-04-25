import 'package:firebase_demo/controllers/auth_controller.dart';
import 'package:firebase_demo/modules/auth/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthController _authController = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("sign In"),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/login_ui.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Sign Up to explore new\nthings , bloc',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: const Color(0xFFF1F1FA)),
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(10)),
                child: CustomTextField(
                  hinText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  controller: _emailController,
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: const Color(0xFFF1F1FA)),
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(10)),
                child: CustomTextField(
                  hinText: 'password',
                  prefixIcon: Icon(Icons.fingerprint),
                  controller: _passwordController,
                )),
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => GestureDetector(
                onTap: () {
                  if(!_authController.isLoading.value) {
                    _authController.login(_emailController.text.trim(), _passwordController.text.trim());
                  }else{
                    null;
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _authController.isLoading.value? Colors.grey: Colors.teal),
                  child: const Center(child: Text('Login')),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have any account?',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {
                    Get.off(SignupPage());
                  },
                  child: const Text(
                    'Signup',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
