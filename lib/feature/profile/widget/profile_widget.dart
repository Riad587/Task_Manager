import 'package:flutter/material.dart';
import 'package:spark_tech_task/core/style/global_text_style.dart';

class ProfileOption extends StatelessWidget {
  final String title;
  final String leadingImage;
  final String? trailingImage;
  final VoidCallback? onTap;

  const ProfileOption({
    super.key,
    required this.title,
    required this.leadingImage,
    this.trailingImage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 6),
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset(
                leadingImage,
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: globalTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (trailingImage != null)
                Image.asset(
                  trailingImage!,
                  height: 15,
                  width: 15,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
