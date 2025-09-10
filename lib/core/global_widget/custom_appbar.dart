import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? backButtonImage;
  final Color backgroundColor;
  final bool showBackButton;
  final double height;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backButtonImage,
    this.backgroundColor = const Color(0xFFFAFBF9),
    this.showBackButton = true,
    this.height = 80, // set AppBar height
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              if (showBackButton)
                GestureDetector(
                  onTap: () => Get.back(),
                  child: backButtonImage != null
                      ? Image.asset(
                          backButtonImage!,
                          height: 80,
                          width: 80,  
                        )
                      : const Icon(Icons.arrow_back, size: 30),
                ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
