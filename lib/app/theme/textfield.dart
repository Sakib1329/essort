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
  static InputDecoration input3({String? hint, hintcolor}) => InputDecoration(
    hintText: hint,

    hintStyle: TextStyle(

      color: hintcolor,
      letterSpacing: 2,
      fontWeight: FontWeight.w400,
    ),
enabledBorder: UnderlineInputBorder(
  borderSide: BorderSide(
    color: AppColors.darkBackground,
  ),

),
    focusedBorder: UnderlineInputBorder(

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
        hintStyle: TextStyle(color: AppColors.lightgray),
        filled: true,
        fillColor: AppColors.black,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.primary,width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.primary,width: 5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color:AppColors.primary),
        ),
// If a suffixIconPath is provided, show the SVG as a button
        suffixIcon: suffixIconPath != null
            ? IconButton(
          icon: SvgPicture.asset(
            suffixIconPath!,
            width: 20,
            height: 20,
          ),
          onPressed: onSuffixTap, // Action when icon is pressed
        )
            : null,
      );
}