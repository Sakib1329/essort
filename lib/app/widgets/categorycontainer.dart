import 'package:essort/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categorycontainer extends StatelessWidget {
  final String title;
  final String? svgAsset;
  final String backgroundAsset;

  const Categorycontainer({
    super.key,
    required this.title,
    required this.backgroundAsset,
    this.svgAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Ensure full width wrapping the image
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            backgroundAsset,
            fit: BoxFit.cover,
          ),
        ),

        // Top-left positioned icon
        if (svgAsset != null)
          Positioned(
            top: 14,
            left: 5,
            child: SvgPicture.asset(
              svgAsset!,
              height: 60,
              color: AppColors.white50,
            ),
          ),

        // Centered Text
        Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
