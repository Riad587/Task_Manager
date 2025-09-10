import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:spark_tech_task/core/const/nav_bar_images.dart';
import 'package:spark_tech_task/feature/home_page/screen/home_page.dart';
import 'package:spark_tech_task/feature/profile/screen/profile.dart';
import 'package:spark_tech_task/feature/task_add/screen/task_add.dart';

import '../controller/bottom_nav_bar_user_controller.dart';

class BottomNavbarUser extends StatelessWidget {
  BottomNavbarUser({super.key});

  final BottomNavbarUserController controller =
      Get.put(BottomNavbarUserController());

  final List<Widget> pages = [
    HomePage(),
    TaskAddScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => ConvexAppBar(
          style: TabStyle.react, // you can try `react`, `flip`, `fixedCircle`
          backgroundColor: Colors.white,
          elevation: 10,
          height: 65,
          items: [
            TabItem(
              icon: Image.asset(
                controller.currentIndex.value == 0
                    ? NavBarImages.acthome
                    : NavBarImages.deacthome,
                height: 35,
              ),
              title: "Home",
            ),
            TabItem(
              icon: Image.asset(
                controller.currentIndex.value == 1
                    ? NavBarImages.actadd
                    : NavBarImages.deactadd,
                height: 35,
              ),
              title: "Earnings",
            ),
            TabItem(
              icon: Image.asset(
                controller.currentIndex.value == 2
                    ? NavBarImages.actprofile
                    : NavBarImages.deactprofile,
                height: 35,
              ),
              title: "Requests",
            ),

          ],
          initialActiveIndex: controller.currentIndex.value,
          onTap: (index) => controller.changeIndex(index),
        ),
      ),
    );
  }
}
