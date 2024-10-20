import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quzie/app/components/universal_media_view.dart';
import 'package:quzie/app/core/nav_helper.dart';
import 'package:quzie/app/extentions/extention_utils.dart';
import 'package:quzie/app/modules/login/controller/login_controller.dart';
import 'package:quzie/app/styles/app_textstyles.dart';

class LoginScreen extends GetView<LoginController>{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4CB0A7),
      body: Stack(
        children: [
          Positioned.fill(child: UniversalMediaView(
            path: "login_texture".tas(),
          )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Text(
                      'QUIZ\nPlayer',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.semiBold20P(color: const Color(0xFF004643)),
                    ),
                  ),
                ),
                const SizedBox(height: 90),
                TextField(
                  controller: controller.usernameController,
                  style: AppTextStyles.regular16P(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
                    labelStyle: AppTextStyles.regular14P(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white)
                    ),
                  ),
                  onChanged: (value){
                    controller.username.value = value;
                  },
                ),
                const SizedBox(height: 20),
                Obx(() {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFEC85C), // Button color
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: controller.username.value != "" ? () {
                        controller.gotoQuestionnaire();
                      } : null,
                      child: Text(
                        'Start',
                        style: AppTextStyles.semiBold18P(),
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}