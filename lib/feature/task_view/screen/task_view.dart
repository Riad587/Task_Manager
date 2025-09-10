import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spark_tech_task/core/global_widget/custom_appbar.dart';
import 'package:spark_tech_task/core/style/global_text_style.dart';
import 'package:spark_tech_task/feature/home_page/controller/home_page_controller.dart';
import 'package:spark_tech_task/feature/task_edit/screen/task_edit.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task; 

  const TaskDetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFBF9),
      appBar: CustomAppBar(
        title: "Tasks Details",
        showBackButton: true,
        backButtonImage: 'assets/images/back.png',
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/title_icon.png', height: 25, width: 25),
                      const SizedBox(width: 8),
                      Text(
                        "Task Title",
                        style:  globalTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    task.title,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Divider(
                    color: Color(0xFF84C000),
                    thickness: 1,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                       Image.asset('assets/images/subtitle_icon.png', height: 25, width: 25),
                      const SizedBox(width: 8),
                      Text(
                        "Task Description",
                        style:  globalTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    task.description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                   const SizedBox(height: 8),
                  Divider(
                    color: Color(0xFF84C000),
                    thickness: 1,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      GestureDetector(onTap: (){}, child: Image.asset('assets/images/delete.png',width: 100)),
                      const SizedBox(width: 8),
                      GestureDetector(onTap:(){Get.to(()=>TaskEditScreen(task: task ,));}, child: Image.asset('assets/images/edit.png', width: 100)),
                    ],
                  )
                ],
              ),
            ),
                  ),
          ],
        ),
      ),
    );
  }
}
