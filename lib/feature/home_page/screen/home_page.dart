import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spark_tech_task/core/style/global_text_style.dart';
import 'package:spark_tech_task/feature/home_page/controller/home_page_controller.dart';
import 'package:spark_tech_task/feature/home_page/widget/home_page_card.dart';
import 'package:spark_tech_task/feature/task_view/screen/task_view.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFBF9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(  // <-- Makes the whole screen scrollable
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello Mojahid',
                          style: globalTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Welcome to Task Manager',
                          style: globalTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'My Tasks',
                  style: globalTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Obx(() {
                  return Column(
                    children: List.generate(controller.tasks.length, (index) {
                      final task = controller.tasks[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CustomCard(
                          title: task.title,
                          subtitle: task.subtitle,
                          onTap: () {
                             Get.to(() => TaskDetailScreen(task: task));
                          },
                        ),
                      );
                    }),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
