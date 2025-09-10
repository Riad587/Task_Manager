import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spark_tech_task/core/global_widget/custom_button.dart';
import 'package:spark_tech_task/core/style/global_text_style.dart';
import 'package:spark_tech_task/feature/auth/onboarding/controller/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
          child: Column(
            children: [
              // Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: controller.previousPage,
                  ),
                  TextButton(
                    onPressed: controller.skip,
                    child: const Text("Skip"),
                  ),
                ],
              ),
          
              // PageView (only content changes)
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: (index) {
                    controller.currentPage.value = index;
                  },
                  itemCount: controller.onboardingData.length,
                  itemBuilder: (context, index) {
                    final item = controller.onboardingData[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(item["image"]!, height: screenSize.height * 0.4),
                        const SizedBox(height: 10),
                        Text(
                          item["title"]!,
                          style: globalTextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item["subtitle"]!,
                          style:  globalTextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),
              ),
                Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.onboardingData.length,
                    (dotIndex) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width:
                          controller.currentPage.value == dotIndex ? 24 : 8,
                      decoration: BoxDecoration(
                        color: controller.currentPage.value == dotIndex
                            ? Color(0xFF84C000)
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              // Indicator (fixed position)

              const SizedBox(height: 20),
          
              // Next Button (fixed position)
              Obx(
                () => CustomButton(
                  onPressed: controller.nextPage,
                  text: controller.currentPage.value ==
                          controller.onboardingData.length - 1
                      ? "Continue"
                      : "Next",
                  isIcon: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}