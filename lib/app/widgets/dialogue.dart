import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:essort/app/theme/button.dart';
import 'package:essort/app/theme/colors.dart';

enum DialogType { standard, warning, success, profile }

class CustomDialog extends StatelessWidget {
  final String title;
  final String confirmText;
  final String cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final DialogType type;
  final bool hasTwoButtons;

  const CustomDialog({
    super.key,
    required this.title,
    this.confirmText = "OK",
    this.cancelText = "Cancel",
    this.onConfirm,
    this.onCancel,
    this.type = DialogType.standard,
    this.hasTwoButtons = true,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color confirmColor;

    switch (type) {
      case DialogType.warning:
        backgroundColor = Colors.deepOrange[800]!;
        confirmColor = Colors.orangeAccent;
        break;
      case DialogType.success:
        backgroundColor = Colors.green[900]!;
        confirmColor = Colors.greenAccent;
        break;
      case DialogType.profile:
        backgroundColor = AppColors.darkBackground;
        confirmColor = AppColors.primary;
        break;
      default:
        backgroundColor = AppColors.VerydarkGray;
        confirmColor = AppColors.brightOrange;
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: backgroundColor,
      child: SizedBox(
        width: 350,
        height: hasTwoButtons ? 350 : 350,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 70),
              if (hasTwoButtons)
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: AppButtonStyle.outlined(
                            AppColors.transparent, confirmColor),
                        onPressed: () {
                          Get.back();
                          if (onConfirm != null) onConfirm!();
                        },
                        child: Text(
                          confirmText,
                          style:
                          const TextStyle(color: AppColors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: OutlinedButton(
                        style: AppButtonStyle.outlined(
                            AppColors.primary, AppColors.darkBackground),
                        onPressed: () {
                          Get.back();
                          if (onCancel != null) onCancel!();
                        },
                        child: Text(
                          cancelText,
                          style:
                          const TextStyle(color: AppColors.primary, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                )
              else
                OutlinedButton(
                  style: AppButtonStyle.outlined(
                      AppColors.transparent, confirmColor),
                  onPressed: () {
                    Get.back();
                    if (onConfirm != null) onConfirm!();
                  },
                  child: Text(
                    confirmText,
                    style: const TextStyle(color: AppColors.white, fontSize: 18),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
