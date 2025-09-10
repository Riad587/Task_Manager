import 'package:flutter/material.dart';
import 'package:spark_tech_task/core/style/global_text_style.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Color fillColor;
  final double borderRadius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? width;
  final int? maxLines;
  final int? minLines;

  const CustomTextField({
    super.key,
    required this.controller,
    this.title = "",
    this.hintText = "",
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.fillColor =  Colors.white,
    this.borderRadius = 10,
    this.prefixIcon,
    this.suffixIcon,
    this.width,

    this.maxLines = 1,
    this.minLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: globalTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black
          ),
        ),
        SizedBox(height: 5,),
        Container(
          width: width ?? double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          alignment: Alignment.center,
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            maxLines: maxLines ,
            minLines: minLines,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Color(0xFF999B9D)),
              border: InputBorder.none,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
