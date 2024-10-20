import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quzie/app/components/list_item.dart';
import 'package:quzie/app/core/nav_helper.dart';
import 'package:quzie/app/modules/quiz_listing/controller/quiz_listing_controller.dart';
import 'package:quzie/app/styles/app_textstyles.dart';

class QuizListing extends GetView<QuizListingController> {
  const QuizListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Challenge",
              style: AppTextStyles.semiBold18P(),
            ),
            const SizedBox(height: 16,),
            const Divider(),
            const SizedBox(height: 8,),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.quiz.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => controller.selectOption(index),
                      child: Obx(() {
                        return ListItem(
                          isSelected: controller.selectedOption.value == index,
                          itemName: controller.quiz[index].quizId!,
                        );
                      }),
                    );
                  },
                );
              }),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Obx(() {
                  return Expanded(
                    child: ElevatedButton(
                      onPressed: controller.selectedOption.value != -1
                          ? () {
                              controller.gotoQuiz();
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF004643),
                        // Button color
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text('Next',
                          style: AppTextStyles.semiBold18P(color: Colors.white)),
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
