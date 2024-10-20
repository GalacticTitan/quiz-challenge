import 'package:get/get.dart';
import 'package:quzie/app/controller/app_controller.dart';
import 'package:quzie/app/modules/leaderboard/controller/leaderboard_controller.dart';
import 'package:quzie/app/modules/login/controller/login_controller.dart';
import 'package:quzie/app/modules/quiz/controller/quiz_controller.dart';
import 'package:quzie/app/modules/quiz_listing/controller/quiz_listing_controller.dart';

class AppBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => QuizController(), fenix: true);
    Get.lazyPut(() => QuizListingController(), fenix: true);
    Get.lazyPut(() => LeaderboardController(), fenix: true);
    Get.put(AppController());
  }
}