import 'package:firebase_database/firebase_database.dart';

class QuizDatasource {
  FirebaseDatabase db = FirebaseDatabase.instance;

  Future<dynamic> getUserData(String quizId, String userId) async{
    final data = await db.ref("users/$userId/answerData/$quizId").get();
    return data.value;
  }

  Future<void> answer(String quizId, String userId, int position, int totalScore,  bool isCorrect) async{
    await db.ref("answers/$quizId/$userId").update({
      if(isCorrect)
      "score": ServerValue.increment(1),
      "totalScore": totalScore,
      "userId": userId
    });
    await db.ref("users/$userId/answerData/$quizId").update({
      "lastQuestion" : position,
      "totalScore": totalScore
    });
  }
}