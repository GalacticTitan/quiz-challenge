import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quzie/app/controller/app_controller.dart';
import 'package:quzie/app/core/nav_helper.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  RxString username = "".obs;

  void gotoQuestionnaire(){
    Get.find<AppController>().userId = usernameController.text;
    NavHelper.gotoQuizes();
  }
}