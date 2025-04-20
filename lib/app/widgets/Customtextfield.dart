import 'package:essort/app/theme/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/colors.dart';
class CustomTextFieldForSetting extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isEditable;
  final bool isPassword;

  final String? suffixIconPath;
  final VoidCallback? onSuffixTap;
  final double? width;

  const CustomTextFieldForSetting({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.isEditable = false,
    this.isPassword = false,

    this.suffixIconPath,
    this.onSuffixTap,
    this.width,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: width ?? double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            key: ValueKey(isEditable),
            controller: controller,
            enabled: isEditable,

            obscureText: isPassword,
            style: const TextStyle(color: Colors.white),
            keyboardType: isPassword ? TextInputType.visiblePassword : TextInputType.text,
            decoration: AppInputDecoration.input2(hint: hintText,suffixIconPath: suffixIconPath,onSuffixTap: onSuffixTap),
          ),
        ],
      ),
    );
  }
}
