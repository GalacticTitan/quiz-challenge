import 'dart:collection';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:quzie/app/modules/leaderboard/models/leaderboard_item.dart';
import 'package:quzie/app/modules/leaderboard/repository/leaderboard_repository.dart';

class LeaderboardController extends GetxController {
  RxList<LeaderboardItem> leaderboardData = RxList();
  final leaderboardRepo = LeaderboardRepository();
  late final String quizId;

  @override
  void onInit() {
    quizId = Get.arguments;
    getLeaderboardData();
    super.onInit();
  }

  void getLeaderboardData() async{
    leaderboardRepo.getLeaderboard(quizId).listen((event) {
      if(event.snapshot.value != null){
        final data = (event.snapshot.value as Map).values.map((e) => LeaderboardItem.fromJson(e),).toList();
        data.sort((a, b) => b.score! - a.score!,);
        leaderboardData.value = data;
      }
    },);
  }
}