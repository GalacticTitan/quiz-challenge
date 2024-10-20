import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get.dart';
import 'package:quzie/app/core/nav_helper.dart';
import 'package:quzie/app/modules/quiz_listing/models/quiz_model.dart';
import 'package:quzie/app/modules/quiz_listing/repository/quiz_listing_repository.dart';

class QuizListingController extends GetxController {
  final repo = QuizListingRepository();
  RxList<QuizModel> quiz = RxList<QuizModel>();

  RxInt selectedOption = (-1).obs;
  bool isLeaderboard  = false;

  @override
  void onInit() {
    getQuestions();
    super.onInit();
  }

  void getQuestions() async{
    final res = await repo.getQuiz();
    quiz.value = res;
  }

  void selectOption(int index) {
    selectedOption.value = index;
  }

  void gotoQuiz() {
    if(FlavorConfig.instance.name == "APP"){
      NavHelper.gotoQuestions(quiz[selectedOption.value]);
    } else {
      NavHelper.gotoLeaderboard(quiz[selectedOption.value].quizId!);
    }
  }
}