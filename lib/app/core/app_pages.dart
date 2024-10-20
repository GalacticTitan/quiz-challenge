import 'package:get/get.dart';
import 'package:quzie/app/modules/leaderboard/views/leaderboard_screen.dart';
import 'package:quzie/app/modules/login/views/login_screen.dart';
import 'package:quzie/app/modules/quiz/views/quiz_screen.dart';
import 'package:quzie/app/modules/quiz_listing/views/quiz_listing.dart';

import 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.login;

  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.questions,
      page: () => const QuizScreen(),
    ),
    GetPage(
      name: Routes.quizListing,
      page: () => const QuizListing(),
    ),
    GetPage(
      name: Routes.leaderboard,
      page: () => LeaderboardScreen(),
    ),
  ];
}
