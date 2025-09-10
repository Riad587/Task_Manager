import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spark_tech_task/core/global_widget/custom_appbar.dart';
import 'package:spark_tech_task/core/global_widget/custom_button.dart';
import 'package:spark_tech_task/core/global_widget/custom_textfield.dart';
import 'package:spark_tech_task/core/style/global_text_style.dart';
import 'package:spark_tech_task/feature/home_page/controller/home_page_controller.dart';
import 'package:spark_tech_task/feature/task_edit/controller/task_edit_controller.dart';

class TaskEditScreen extends StatelessWidget {
  final Task task;

   TaskEditScreen({super.key, required this.task});
  final controller = Get.put(TaskEditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFFAFBF9),
      appBar: CustomAppBar(
        title: "Update Task",
        showBackButton: true,
        backButtonImage: 'assets/images/back.png',
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
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
                    CustomTextField(
                      controller: controller.titleController,
                      hintText: task.title,
                      ),
                    const SizedBox(height: 20),
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
                    CustomTextField(
                      controller: controller.titleController,                 
                      hintText: task.description,
                      maxLines: 4,
                      ),
                    const SizedBox(height: 20),
                    CustomButton(onPressed: (){}, text: "Update Task"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
