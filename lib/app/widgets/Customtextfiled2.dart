import 'package:flutter/material.dart';
import 'package:essort/app/theme/colors.dart';
import 'package:flutter_svg/svg.dart';


import '../theme/textfield.dart';
import 'Aidialogue.dart';
import 'categorypopup.dart';

class LabeledExpandableTextField extends StatelessWidget {
  final String label;
  final String svgPath;
  final TextEditingController? controller;
  final String? hintText;
  final bool istrue;

  const LabeledExpandableTextField({
    Key? key,

     this.label="",
     this.svgPath="",
    required this.istrue,
    this.controller,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(istrue)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),

            ),
            IconButton(
              onPressed: (){

                showSlidingDialog(context);
              },
              icon: SvgPicture.asset(
                svgPath,
                height: 40,
                width: 40,
                colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 200,
          child: TextField(
            controller: controller,
            expands: true,
            maxLines: null,
            minLines: null,
            style: const TextStyle(color: AppColors.white),
            textAlignVertical: TextAlignVertical.top,
            cursorColor: AppColors.primary,
            decoration: AppInputDecoration.input1().copyWith(
              hintText: hintText,
              hintStyle: const TextStyle(color: AppColors.white50),
            ),
          ),
        ),
      ],
    );
  }
}
