import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spark_tech_task/feature/auth/sign_in/screen/sign_in.dart';
import 'package:spark_tech_task/feature/bottom_nav_user/controller/bottom_nav_bar_user_controller.dart';
import 'package:spark_tech_task/feature/profile/widget/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔹 Fixed height Stack
              SizedBox(
                height: 150, // adjust height as needed
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    // Background Image
                    Positioned.fill(
                      child: Image.asset(
                        "assets/images/profile_bg.png",
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Circle Avatar at bottom center
                    Positioned(
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage:
                            const AssetImage("assets/images/user_profile.png"),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              const Text(
                "John Doe",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Options
              ProfileOption(
                leadingImage: 'assets/icons/profile_icon.png',
                title: 'Profile',
                trailingImage: 'assets/icons/trialing_icon.png',
                onTap: () => print("Profile tapped"),
              ),
              ProfileOption(
                leadingImage: 'assets/icons/settings_icon.png',
                title: 'Account Settings',
                trailingImage: 'assets/icons/trialing_icon.png',
                onTap: () => print("Settings tapped"),
              ),

              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "More",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              ProfileOption(
                leadingImage: 'assets/icons/terms_icon.png',
                title: 'Terms & Condition',
                trailingImage: 'assets/icons/trialing_icon.png',
                onTap: () => print("Terms tapped"),
              ),
              ProfileOption(
                leadingImage: 'assets/icons/privacy_icon.png',
                title: 'Privacy policy',
                trailingImage: 'assets/icons/trialing_icon.png',
                onTap: () => print("Privacy tapped"),
              ),
              ProfileOption(
                leadingImage: 'assets/icons/support_icon.png',
                title: 'Support',
                trailingImage: 'assets/icons/trialing_icon.png',
                onTap: () => print("Support tapped"),
              ),
              ProfileOption(
                leadingImage: 'assets/icons/logout_icon.png',
                title: 'Logout',
                onTap: (){
                    Get.offAll(() => SignInPage());
                    if (Get.isRegistered<BottomNavbarUserController>()) {
                      Get.delete<BottomNavbarUserController>();
                    }
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
