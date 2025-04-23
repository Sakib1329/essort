import 'package:essort/app/theme/colors.dart';
import 'package:essort/app/theme/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg

class CustomTextFieldForSetting extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final bool isReadOnly;
  final String? suffixIconPath; // Update to hold path for SVG
  final VoidCallback? onSuffixTap;
  final bool isEditable;
  const CustomTextFieldForSetting({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.isPassword = false,
    this.isReadOnly = false,
    this.suffixIconPath, // Used SVG path here
    this.onSuffixTap,
    this.isEditable = false, // Add isEditable to control whether it's editable
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
// Label for the text field
        Text(
          label,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 6),
// Text Field
        TextField(
cursorColor: AppColors.primary,

          style: TextStyle(color: AppColors.white),
          controller: controller,
          obscureText: isPassword,
          obscuringCharacter: "*",
          decoration: AppInputDecoration.input2(hint: hintText,onSuffixTap: onSuffixTap,suffixIconPath: suffixIconPath,)
        ),
      ],
    );
  }
}