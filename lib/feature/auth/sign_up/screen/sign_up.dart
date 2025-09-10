import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spark_tech_task/core/global_widget/custom_button.dart';
import 'package:spark_tech_task/core/global_widget/custom_password_field.dart';
import 'package:spark_tech_task/core/global_widget/custom_textfield.dart';
import 'package:spark_tech_task/core/style/global_text_style.dart';
import 'package:spark_tech_task/feature/auth/sign_in/screen/sign_in.dart';
import 'package:spark_tech_task/feature/auth/sign_up/controller/sign_up_controller.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 20,
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
                                  "Create Your Account",
                                  style: globalTextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Join Task Manager today — organize better, work smarter, and stay in control of your day.",
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
                                controller: controller.firstNameController,
                                hintText: 'e.g. Kristin ',
                                title: "First Name",
                              ),
                              const SizedBox(height: 15),
                              CustomTextField(
                                controller: controller.lastNameController,
                                hintText: 'e.g. Cooper',
                                title: "Last Name",
                              ),
                              const SizedBox(height: 15),
                               CustomTextField(
                                controller: controller.emailController,
                                hintText: 'e.g. kristin.cooper@example.com',
                                title: "Email Address",
                              ),
                              const SizedBox(height: 15),
                               CustomTextField(
                                controller: controller.addressController,
                                hintText: 'e.g. 1234 Elm Street, Springfield, IL',
                                title: "Address",
                              ),
                              const SizedBox(height: 15),
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
                               const SizedBox(height: 15),
                              Obx(
                                () => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomPasswordField(
                                      hintText: '*********',
                                      title: "Confirm Password",
                                      controller: controller.conPassController,
                                      obscureText:
                                          !controller.isConPasswordVisible.value,
                                      keyboardType: TextInputType.visiblePassword,
                                      suffixIcon: InkWell(
                                        onTap:
                                            controller.toggleConPasswordVisibility,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            right: 12.0,
                                          ),
                                          child: Image.asset(
                                            controller.isConPasswordVisible.value
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
                              Obx(()=> Checkbox( 
                                activeColor: Color(0xFF84C000),
                                value: controller.isChecked.value, 
                                onChanged: (value){
                                        controller.isChecked.value = value!;
                                      }),),
                               Flexible(
                                 child: Text(
                                  'I agree to the Terms & Conditions and Privacy Policy.',
                                  style: globalTextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF6A6D70),
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
                                  text: "Already have an account? ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                TextSpan(
                                  text: "Sign In",
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
                                          Get.to(() => SignInPage());
                                        },
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(height: 20),
                          CustomButton(
                            text: "Continue ",
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
                              else if (controller.passwordController.text.isEmpty || controller.conPassController.text.isEmpty) {
                                Get.snackbar("Empty", "Password cannot be empty.");
                              }
                              else if (controller.passwordController.text != controller.conPassController.text) {
                                Get.snackbar("Not matched", "Confirm password not matched.");
                              }
                              else if(!controller.isChecked.value){
                                Get.snackbar("Unchecked", "Please agree to the Terms & Conditions and Privacy Policy.");
                              }
                              else
                              {
                                controller.createAccount();
                              }
                              
        
                            },
                          ),
            
                          const SizedBox(height: 24),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}
