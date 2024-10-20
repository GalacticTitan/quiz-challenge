import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quzie/app/components/list_item.dart';
import 'package:quzie/app/modules/quiz/controller/quiz_controller.dart';
import 'package:quzie/app/styles/app_textstyles.dart';

class QuizScreen extends GetView<QuizController> {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffececec),
      appBar: AppBar(
        title: const Text("Quiz App"),
      ),
      body: Obx(() {
        if(controller.isCompleted.value) {
          return Center(child: Lottie.asset("assets/lottie/anim_completed.lottie", decoder: customDecoder));
        }
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  '${controller.currentQuestion}/${controller.totalQuestions}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 16),
              Stack(
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      height: 150,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            controller.questionText.value,
                            style: AppTextStyles.semiBold18P(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: CircularProgressIndicator(
                            value: controller.timeRemaining / 60,
                            backgroundColor: const Color(0xffABD1C6),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xff004643)),
                            strokeWidth: 5,
                          ),
                        ),
                        Text(
                          '${controller.timeRemaining}',
                          style: AppTextStyles.semiBold24P(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Obx(() {
                    return ListView.builder(
                      itemCount: controller.options.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => controller.selectOption(index),
                          child: Obx(() {
                              return ListItem(isSelected: controller.selectedOption.value == index,
                              itemName: controller.options[index],);
                            }
                          ),
                        );
                      },
                    );
                  }
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed:
                          controller.selectedOption.value != -1 ? () {
                        controller.nextQuestion();
                          } : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF004643),
                        // Button color
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text('Next',
                          style:
                              AppTextStyles.semiBold18P(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  Future<LottieComposition?> customDecoder(List<int> bytes) {
    return LottieComposition.decodeZip(bytes, filePicker: (files) {
      return files.firstWhereOrNull(
              (f) => f.name.startsWith('animations/') && f.name.endsWith('.json'));
    });
  }
}
