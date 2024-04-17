import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shoopp/controller/home_controller.dart';
import 'package:shoopp/firebase_option.dart';
import 'package:shoopp/pages/home_page.dart';

Future<void> main() async {
  // to call fire base before run app
  WidgetsFlutterBinding.ensureInitialized();
  // to get info  form fire base firebase option
  await Firebase.initializeApp(options: firebaseOptions);
  //? register my controller
  Get.put(HomeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
