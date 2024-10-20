import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:quzie/app/controller/app_controller.dart';
import 'package:quzie/app/modules/quiz/repository/quiz_repository.dart';
import 'package:quzie/app/modules/quiz_listing/models/quiz_model.dart';

class QuizController extends GetxController {
  int currentQuestion = 0;
  int totalQuestions = 1;
  RxInt selectedOption = (-1).obs;
  RxInt timeRemaining = 60.obs;
  RxString questionText = "".obs;
  RxBool isCompleted = false.obs;
  late final QuizModel quizModel;
  RxList<String> options = RxList();
  Timer? timer;
  final quizRepository = QuizRepository();

  @override
  void onInit() {
    quizModel = Get.arguments as QuizModel;
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        setQuestion();
      },
    );
    super.onInit();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void setQuestion() async {
    final userData = (await quizRepository.getUserData(
        quizId: quizModel.quizId!, userId: Get.find<AppController>().userId!)) ?? {};
    if (userData.isNotEmpty) {
      if (userData["lastQuestion"]! < quizModel.questions!.length - 1) {
        currentQuestion = userData["lastQuestion"]! + 1;
        setUI();
      } else {
        isCompleted.value = true;
      }
    } else {
      setUI();
    }
    reset();
  }

  void setUI() {
    questionText.value = quizModel.questions![currentQuestion].question!;
    options.value = quizModel.questions![currentQuestion].options!;
    totalQuestions = quizModel.questions!.length;
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeRemaining > 0) {
        timeRemaining--;
      } else {
        nextQuestion();
        timer.cancel();
      }
    });
  }

  void reset() {
    timer?.cancel();
    timeRemaining.value = 60;
    setUI();
    startTimer();
  }

  void selectOption(int index) {
    selectedOption.value = index;
  }

  void nextQuestion() async {
    if(currentQuestion == quizModel.questions!.length){
      isCompleted.value = true;
      return;
    }
    await quizRepository.answer(
        quizId: quizModel.quizId!,
        userId: Get.find<AppController>().userId!,
        position: currentQuestion,
        totalScore: quizModel.questions!.length,
        isCorrect: selectedOption.value ==
            quizModel.questions![currentQuestion].answer);
    selectedOption.value = -1;
    currentQuestion++;
    reset();
  }
}
