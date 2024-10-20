import 'package:quzie/app/modules/quiz_listing/datasource/quiz_listing_datasource.dart';
import 'package:quzie/app/modules/quiz_listing/models/quiz_model.dart';

class QuizListingRepository {
  final datasource = QuizListingDatasource();

  Future<List<QuizModel>> getQuiz() {
    return datasource.getQuiz();
  }
}