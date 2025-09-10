import 'package:flutter/material.dart';
import 'package:spark_tech_task/core/style/global_text_style.dart';

class CustomPasswordField extends StatefulWidget {
  final IconData? icon;
  final String? title;
  final String? hintText;
  final String? prefixDisplay;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final Color? borderColor; // Dynamic border color
  final Color? backgroundColor; // Optional background color

  const CustomPasswordField({
    super.key,
    this.icon,
    this.borderColor,
    this.title,
    this.hintText,
    this.prefixDisplay,
    required this.controller,
    this.onTap,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.backgroundColor,
  });

  @override
  _CustomTextField4State createState() => _CustomTextField4State();
}

class _CustomTextField4State extends State<CustomPasswordField> {
  late FocusNode _focusNode;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _isInitialized = true;
  }

  @override
  void dispose() {
    if (_isInitialized) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text(
          widget.title ?? "",
          style: globalTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black
          ),
        ),
        SizedBox(height: 5,),
        Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? Colors.white, // Use bg color if provided
            borderRadius: BorderRadius.circular(10),
             boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            onTap: widget.onTap,
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              prefixIcon: widget.icon != null
                  ? Icon(widget.icon, color: Colors.grey)
                  : widget.prefixDisplay != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                          child: Text(
                            widget.prefixDisplay!,
                            style: const TextStyle(color: Colors.black),
                          ),
                        )
                      : null,
              suffixIcon: widget.suffixIcon,
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: Color(0xFF999B9D)),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
          ),
        ),
      ],
    );
  }
}
