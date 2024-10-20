import 'package:firebase_database/firebase_database.dart';
import 'package:quzie/app/modules/quiz_listing/models/quiz_model.dart';

class QuizListingDatasource {

  FirebaseDatabase db = FirebaseDatabase.instance;

  Future<List<QuizModel>> getQuiz() async{
    final data = await db.ref("quizes").get();
    return (data.value as List).map((e) => QuizModel.fromJson(e),).toList();
  }
}