import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:spark_tech_task/feature/bottom_nav_user/screen/bottom_nav_bar_user.dart';
import 'package:spark_tech_task/feature/home_page/screen/home_page.dart';
import 'package:spark_tech_task/feature/profile/screen/profile.dart';
import 'package:spark_tech_task/feature/splash_screen/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      builder: EasyLoading.init(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BottomNavbarUser(),
    );
  }
}
