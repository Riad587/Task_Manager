import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spark_tech_task/core/global_widget/custom_button.dart';
import 'package:spark_tech_task/core/global_widget/custom_password_field.dart';
import 'package:spark_tech_task/core/global_widget/custom_textfield.dart';
import 'package:spark_tech_task/core/style/global_text_style.dart';
import 'package:spark_tech_task/feature/auth/sign_in/controller/sign_in_controller.dart';
import 'package:spark_tech_task/feature/auth/sign_up/screen/sign_up.dart';
import 'package:spark_tech_task/feature/bottom_nav_user/screen/bottom_nav_bar_user.dart';
import 'package:spark_tech_task/feature/home_page/screen/home_page.dart';


class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Welcome Back!",
                                style: globalTextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Stay productive and take control of your tasks.",
                              style: globalTextStyle(
                                fontSize: 14,
                                color: Color(0XFF4D5154),
                              ),
                            ),
                          ],
                        ),
          
                        const SizedBox(height: 24),
                        Column(
                          children: [
                            CustomTextField(
                              controller: controller.emailController,
                              hintText: 'Enter your email',
                              title: "Email Address",
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 10),
                            Obx(
                              () => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomPasswordField(
                                    hintText: 'Password',
                                    title: "Password",
                                    controller: controller.passwordController,
                                    obscureText:
                                        !controller.isPasswordVisible.value,
                                    keyboardType: TextInputType.visiblePassword,
                                    suffixIcon: InkWell(
                                      onTap:
                                          controller.togglePasswordVisibility,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          right: 12.0,
                                        ),
                                        child: Image.asset(
                                          controller.isPasswordVisible.value
                                              ? 'assets/icons/eye_open.png'
                                              : 'assets/icons/eye_close.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
          
                        const SizedBox(height: 10),
               
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => InkWell(
                                onTap: controller.toggleRememberMe,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 18,
                                      height: 18,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                            255,
                                            100,
                                            99,
                                            99,
                                          ),
                                          width: 2,
                                        ),
                                      ),
                                      child:
                                          controller.rememberMe.value
                                              ? Center(
                                                child: Container(
                                                  width: 10,
                                                  height: 10,
                                                  decoration:
                                                      const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.black,
                                                      ),
                                                ),
                                              )
                                              : null,
                                    ),
                                    const SizedBox(width: 6),
                                    const Text(
                                      "Remember me",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0XFF6A6D70),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        
                            GestureDetector(
                              onTap: () {
                              //  Get.to(() => ForgotPasswordScreen());
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF6A6D70),
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFF6A6D70),
                                  height: 1.2,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Don’t have an account? ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text: "Sign Up",
                                style: const TextStyle(
                                  color: Color(0xff3BD85E),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xff3BD85E),
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.to(() => SignUpScreen());
                                      },
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(height: 15),
                        CustomButton(
                          text: "Sign In",
                          onPressed: () {
                            RegExp emailRegex = RegExp(
                              r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
                            );

                            // Validate email
                            if (controller.emailController.text.isEmpty) {
                              Get.snackbar("Empty", "Email cannot be empty.");
                            
                            } else if (!emailRegex.hasMatch(controller.emailController.text.trim())) {
                              Get.snackbar("Invalid", "Invalid email format.");
                             
                            }
                              else if (controller.passwordController.text.isEmpty) {
                              Get.snackbar("Empty", "Password cannot be empty.");
                            
                            }
                            else
                            {
                           //  controller.login();
                           Get.to(() => BottomNavbarUser());
                            }
                            

                          },
                        ),
          
                        const SizedBox(height: 24),
                      ],
                    ),
        ),
      ),
    );
  }
}
