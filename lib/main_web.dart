import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get.dart';
import 'package:quzie/app/bindings/app_bindings.dart';
import 'package:quzie/app/core/app_pages.dart';
import 'package:quzie/app/core/app_routes.dart';
import 'package:quzie/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlavorConfig(
    name: "LEAD",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: Routes.quizListing,
      getPages: AppPages.routes,
      initialBinding: AppBindings(),
    );
  }
}
