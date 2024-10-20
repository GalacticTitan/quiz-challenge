import 'package:get/get.dart';
import 'package:quzie/app/core/app_routes.dart';
import 'package:quzie/app/modules/quiz_listing/models/quiz_model.dart';

class NavHelper {
  static void gotoQuestions(QuizModel quizModel){
    Get.toNamed(Routes.questions, arguments: quizModel);
  }
  static void gotoQuizes(){
    Get.toNamed(Routes.quizListing);
  }
  static void gotoLeaderboard(String quizId){
    Get.toNamed(Routes.leaderboard, arguments: quizId);
  }
}