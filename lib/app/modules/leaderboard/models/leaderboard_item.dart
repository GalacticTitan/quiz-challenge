class LeaderboardItem {
  LeaderboardItem({
      this.userId, 
      this.score,});

  LeaderboardItem.fromJson(dynamic json) {
    userId = json['userId'];
    score = json['score'];
    totalScore = json['totalScore'];
  }
  String? userId;
  int? score;
  num? totalScore;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['score'] = score;
    return map;
  }

}