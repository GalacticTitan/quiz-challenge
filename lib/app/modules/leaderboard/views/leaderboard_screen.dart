import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quzie/app/components/universal_media_view.dart';
import 'package:quzie/app/extentions/extention_utils.dart';
import 'package:quzie/app/modules/leaderboard/controller/leaderboard_controller.dart';
import 'package:quzie/app/styles/app_textstyles.dart';

class LeaderboardScreen extends GetView<LeaderboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Leaderboard'),
      ),
      body: Obx(() {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (controller.leaderboardData.length > 1)
                        _buildTopPlayer(
                            controller.leaderboardData[1].userId!,
                            controller.leaderboardData[1].score!,
                            controller.leaderboardData[1].totalScore!,
                            2),
                      if (controller.leaderboardData.isNotEmpty)
                        _buildTopPlayer(
                            controller.leaderboardData[0].userId!,
                            controller.leaderboardData[0].score!,
                            controller.leaderboardData[0].totalScore!,
                            1, isTop: true),
                      if (controller.leaderboardData.length > 2)
                        _buildTopPlayer(
                            controller.leaderboardData[2].userId!,
                            controller.leaderboardData[2].score!,
                            controller.leaderboardData[2].totalScore!,
                            3),
                    ],
                  );
                }),
              ),
              const Divider(),
              if(controller.leaderboardData.length > 3)
              Expanded(
                child: Obx(() {
                    return ListView.builder(
                      itemCount: controller.leaderboardData.length - 3,
                      itemBuilder: (context, index) {
                        final player = controller.leaderboardData[index + 3];
                        return _buildLeaderboardItem(
                            player.userId!,
                            (index + 4).toString(),
                            player.score!,
                            player.totalScore!,);
                      },
                    );
                  }
                ),
              ),
            ],
          );
        }
      ),
    );
  }

  Widget _buildTopPlayer(String name, num score, num total, int rank,
      {bool isTop = false}) {
    return Column(
      children: [
        Text(rank.toString(), style: AppTextStyles.bold16P(),),
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: isTop ? 50 : 20,
              child: const Icon(Icons.person),
            ),
            if (isTop)
              const Positioned(
                top: 0,
                child: Icon(Icons.emoji_events, color: Colors.amber, size: 24),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          "$score/$total",
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildLeaderboardItem(String name, String index, num score, num total) {
    return ListTile(
      leading: SizedBox(
        width: 70,
        child: Row(
          children: [
            Text(index, style: AppTextStyles.regular16P(),),
            const SizedBox(width: 20,),
            const CircleAvatar(
              child: Icon(Icons.person),
            ),
          ],
        ),
      ),
      title: Text(name,),
      trailing: Text("$score/$total"),
    );
  }
}
