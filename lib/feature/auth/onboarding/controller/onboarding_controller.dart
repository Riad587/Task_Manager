import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:spark_tech_task/feature/auth/sign_in/screen/sign_in.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;
  final PageController pageController = PageController();

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onboarding1.png",
      "title": "Manage Everything in One Place",
      "subtitle": "Create, categorize, and keep track of all your personal and work tasks effortlessly — right from your dashboard."
    },
    {
      "image": "assets/images/onboarding2.png",
      "title": "Focus on What Matters Most",
      "subtitle": "Set priorities, add deadlines, and sort tasks by importance so you can tackle what truly moves you forward.n"
    },
    {
      "image": "assets/images/onboarding3.png",
      "title": "Visualize Progress, Stay on Track",
      "subtitle": "Monitor completed tasks, ongoing projects, and upcoming deadlines — all in a clear, visual format."
    },
  ];

  void nextPage() {
    if (currentPage.value < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Get.to(()=> SignInPage());
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void skip() {
    pageController.jumpToPage(onboardingData.length - 1);
  }
}