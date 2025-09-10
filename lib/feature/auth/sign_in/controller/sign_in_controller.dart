import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:spark_tech_task/core/network_endpoint/endpoints.dart';
import 'package:spark_tech_task/feature/bottom_nav_user/screen/bottom_nav_bar_user.dart';


class SignInController extends GetxController {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isPasswordVisible = false.obs;
  final rememberMe = false.obs;
  final hasPasswordError = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }


  @override
  void onClose() {
    //emailController.dispose();
    // passwordController.dispose();
    super.onClose();
  }
  
  Future<void> login() async {
    final url = Uri.parse(Urls.login);

    try {
      EasyLoading.show(status: "Logging in...");

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
        }),
      );

      if (kDebugMode) {
        debugPrint("Login response: ${response.body}");
      }

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Save token or user info if returned
        // Example: GetStorage().write('token', data['token']);

        Get.snackbar("Success", "Login successful");
        // Navigate to Home page
       // Get.to(() => HomePage());
       Get.snackbar("Successfully loged in", "Success");
      } else {
        final data = jsonDecode(response.body);
        Get.snackbar("Error", data['message'] ?? 'Login failed');
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint("Exception during login: $e");
      }
      Get.snackbar("Error", "Something went wrong");
    } finally {
      EasyLoading.dismiss();
    }
  }

}
