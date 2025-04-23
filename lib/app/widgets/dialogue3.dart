import 'package:flutter/material.dart';
import 'package:essort/app/theme/button.dart';
import 'package:essort/app/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

class MessageDialog extends StatelessWidget {
  final String message;
  final VoidCallback onPressed;

  const MessageDialog({
    super.key,
    required this.message,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.softPeach,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85, // 85% of screen width
        height: 250, // Fixed height
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: AppColors.vibrantRed, fontSize: 20),
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 120, // You can adjust this width
                      child: ElevatedButton(
                        onPressed: onPressed,
                        style: AppButtonStyle.elevatedButton(AppColors.brightRed2, AppColors.transparent),
                        child: const Text('GO', style: TextStyle(color: AppColors.white, fontSize: 16)),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: SvgPicture.asset(
                  'assets/icons/close.svg',
                  height: 30,
                  width: 30,
                  colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
