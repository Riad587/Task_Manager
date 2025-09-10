import 'package:flutter/material.dart';
import 'package:spark_tech_task/core/style/global_text_style.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final double? width;
  final double? height;
  final bool isIcon;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = const Color(0xFF84C000),
    this.textColor =  Colors.white,
    this.borderRadius = 12,
    this.width,
    this.height = 50,
    this.isIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style:  globalTextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(width: 10,),
            isIcon? Icon(Icons.arrow_right_alt, color: textColor,):SizedBox(),
          ],
        ),
      ),
    );
  }
}
