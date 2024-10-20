import 'package:firebase_database/firebase_database.dart';
import 'package:quzie/app/modules/leaderboard/datasource/leaderboard_datasource.dart';
import 'package:quzie/app/modules/leaderboard/models/leaderboard_item.dart';

class LeaderboardRepository {
  final datasource = LeaderboardDatasource();

  Stream<DatabaseEvent> getLeaderboard(String quizId) {
    return datasource.getLeaderboard(quizId);
  }
}