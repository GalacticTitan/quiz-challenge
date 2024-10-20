import 'package:quzie/app/modules/quiz/datasource/quiz_datasource.dart';

class QuizRepository {
  final datasource = QuizDatasource();

  Future<dynamic> getUserData(
      {required String quizId, required String userId}) async {
    return datasource.getUserData(quizId, userId);
  }

  Future<void> answer(
      {required String quizId,
      required String userId,
      required int position,
      required int totalScore,
      required bool isCorrect}) async {
    return datasource.answer(quizId, userId, position, totalScore, isCorrect);
  }
}
