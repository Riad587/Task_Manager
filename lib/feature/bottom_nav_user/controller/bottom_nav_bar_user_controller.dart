import 'package:get/get.dart';

class BottomNavbarUserController extends GetxController {
  var currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
  void clearIndex() {
    currentIndex.value = 0;
  }
}
