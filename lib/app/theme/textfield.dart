import 'package:essort/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class AppInputDecoration {
  static InputDecoration input1({String? hint}) => InputDecoration(
    hintText: hint,

    hintStyle: TextStyle(

      color: AppColors.white50,
      letterSpacing: 2,
      fontWeight: FontWeight.w400,
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.primary, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.primary, width: 1),
    ),
  );

  static InputDecoration input2({
    String? hint,
    String? suffixIconPath,
    VoidCallback? onSuffixTap,
  }) =>
      InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
        suffixIcon: suffixIconPath != null
            ? IconButton(
          onPressed: () {
            print("Tapped!");
            if (onSuffixTap != null) onSuffixTap!();
          },
          icon: SvgPicture.asset(
            suffixIconPath,
            width: 24,
            height: 24,
            color: AppColors.primary,
          ),
        )
            : null,
      );
}