import 'package:essort/app/widgets/timepickerpopup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/button.dart';
import '../theme/colors.dart';

class YesNoPopup {
  static void show(
      BuildContext context, {
        required String title,
        required void Function(bool isYes) onSubmit,
      }) {
    showDialog(
      context: context,
      builder: (_) => _YesNoDialog(title: title, onSubmit: onSubmit),
    );
  }
}

class _YesNoDialog extends StatefulWidget {
  final String title;
  final void Function(bool isYes) onSubmit;

  const _YesNoDialog({
    required this.title,
    required this.onSubmit,
  });

  @override
  State<_YesNoDialog> createState() => _YesNoDialogState();
}

class _YesNoDialogState extends State<_YesNoDialog> {
  bool? _selected;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30), // space for cross
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
             Row(

               children: [
                 _buildOption("Yes", true),
SizedBox(width: 30,),
                 _buildOption("No", false),
               ],
             ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      QuickReminderPopup.show(context,title: 'How many Times you want shift each task?');

                    },
                    style: AppButtonStyle.elevatedButton(
                      AppColors.primary,
                      AppColors.transparent,
                    ),

                    child: Text(
                      'Go',
                      style: TextStyle(color: Colors.white, fontSize: 20),
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
    );
  }

  Widget _buildOption(String label, bool value) {
    final isSelected = _selected == value;

    return GestureDetector(
      onTap: () => setState(() => _selected = value),
      child: Row(
        children: [
          Container(
            height: 24,
            width: 24,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: AppColors.primary, width: 2),
              color: isSelected ? AppColors.primary : Colors.transparent,
            ),
            child: isSelected
                ? const Icon(Icons.check, color: AppColors.white, size: 20)
                : null,
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
