import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:spark_tech_task/core/network_endpoint/endpoints.dart';
import 'package:spark_tech_task/feature/auth/sign_in/screen/sign_in.dart';
import 'package:spark_tech_task/feature/bottom_nav_user/screen/bottom_nav_bar_user.dart';


class SignUpController extends GetxController {

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final conPassController = TextEditingController();

  final isPasswordVisible = false.obs;
    final isConPasswordVisible = false.obs;
  final rememberMe = false.obs;
  final isChecked = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConPasswordVisibility() {
    isConPasswordVisible.value = !isConPasswordVisible.value;
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



Future<void> createAccount() async {
  final url = Uri.parse('${Urls.baseUrl}/user/register');

  try {
    var request = http.MultipartRequest('POST', url);

    // ✅ Send only fields (no files)
    request.fields['firstName'] = firstNameController.text;
    request.fields['lastName']  = lastNameController.text;
    request.fields['email']     = emailController.text.trim();
    request.fields['password']  = passwordController.text.trim();

    // Send request
    var response = await request.send();
    var responseData = await http.Response.fromStream(response);

    if (kDebugMode) {
      debugPrint("Sign up response: ${responseData.body}");
    }

    if (response.statusCode == 200) {
      print("✅ Success: ${responseData.body}");
      Get.to(() => SignInPage());
    } else {
      print("❌ Error: ${responseData.body}");
    }
  } catch (e) {
    print("⚠️ Exception: $e");
  } finally {
    EasyLoading.dismiss();
  }
}



}
