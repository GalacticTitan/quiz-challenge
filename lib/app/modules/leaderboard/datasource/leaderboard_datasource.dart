import 'package:firebase_database/firebase_database.dart';
import 'package:quzie/app/modules/leaderboard/models/leaderboard_item.dart';

class LeaderboardDatasource {
  FirebaseDatabase db = FirebaseDatabase.instance;
  
  Stream<DatabaseEvent> getLeaderboard(String quizId) {
    return db.ref("answers/$quizId").limitToFirst(10).onValue;
  }
}