import 'dart:async';
import 'package:get/get.dart';
import 'package:spark_tech_task/feature/auth/onboarding/screen/onboarding.dart';


class SplashScreenController extends GetxController {
  void checkIsLogin() async {
    Timer(const Duration(seconds: 3), () async {
      // Check if the token exists in shared preferences
      //String? token = await SharedPreferencesHelper.getAccessToken();
      //print("Token is : ${token}");
      // if (token != null && token.isNotEmpty) {
      //   Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      //   String role = decodedToken["role"];

      //   if (role == "Sender") {
      //     Get.to(() => BottomNavbar());
      //   } else if (role == "Courier") {
      //     Get.to(() => BottomNavbarCourier());
      //   } else {
      //     EasyLoading.showSuccess("failed! ");
      //   }
      // } else {
      //   // Redirect to the Welcome Screen if no token is found
      //   // Get.offAll(BottomNavbar());
         Get.offAll(OnboardingScreen());
      // }

    });
  }

  @override
  void onInit() {
    super.onInit();
    checkIsLogin();
  }
}
