import 'package:essort/app/theme/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/colors.dart';

class TextFieldPopup {
  static void show(
      BuildContext context, {
        required String title,
      }) {
    showDialog(
      context: context,
      builder: (_) => _TextFieldDialog(title: title),
    );
  }
}

class _TextFieldDialog extends StatefulWidget {
  final String title;

  const _TextFieldDialog({
    required this.title,
  });

  @override
  State<_TextFieldDialog> createState() => _TextFieldDialogState();
}

class _TextFieldDialogState extends State<_TextFieldDialog> {
  final TextEditingController _controller = TextEditingController();

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
                const SizedBox(height: 30), // Space for the cross button
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  cursorColor: AppColors.primary,
                  controller: _controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: AppInputDecoration.input3(hint: 'TITLE',hintcolor: AppColors.white)
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Here you can handle the text input however you'd like
                      final inputText = _controller.text;
                      print('Entered text: $inputText');
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(100, 40),
                    ),
                    child: const Text('Set'),
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
}
