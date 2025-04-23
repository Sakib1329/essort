import 'package:essort/app/widgets/popupmenuButton2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:essort/app/theme/colors.dart';
import 'package:essort/app/theme/button.dart';

import 'categorycontainer.dart';
import 'dialogue3.dart';
import 'dialogue4.dart';

class AddCategoryDialog extends StatelessWidget {
  final String title;
  final VoidCallback onSubmit;

  const AddCategoryDialog({
    super.key,
    required this.title,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();

    return Dialog(
      backgroundColor: AppColors.VerydarkGray,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        width: 450, // Wider dialog
        height: 600, // Shorter height
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 25,
                        color: AppColors.primary,
                        fontFamily: 'Schuyler',
                      ),
                    ),
                    SizedBox(
                      width: 130,
                      child: Divider(color: AppColors.primary, thickness: 1),
                    ),
                    SizedBox(
                      width: 130,
                      height: 1,
                      child: Divider(
                        color: AppColors.primary,
                        indent: 60,
                        thickness: 1,
                      ),
                    ),
                    SizedBox(height: 20),
                    LongPressPopupMenu(
                      onDelete: () {
                        showDialog(
                          context: context,
                          builder: (_) => MessageDialog(
                            message: 'Are you sure you want to delete this item?',
                            onPressed: () => Navigator.pop(context),
                          ),
                        );
                      },
                      onRename: () {
                        TextFieldPopup.show(context, title: 'Rename the Category');
                      },
                      child: Categorycontainer(
                        title: 'Agenda',
                        backgroundAsset: 'assets/images/img_14.png',
                        svgAsset: 'assets/icons/agenda.svg',
                      ),
                    ),
                    SizedBox(height: 10),
                    LongPressPopupMenu(
                      child: Categorycontainer(
                        title: 'Creativity',
                        backgroundAsset: 'assets/images/img_15.png',
                        svgAsset: 'assets/icons/creativity.svg',
                      ),
                    ),
                    SizedBox(height: 10),
                    LongPressPopupMenu(
                      child: Categorycontainer(
                        title: 'Learning',
                        backgroundAsset: 'assets/images/img_16.png',
                        svgAsset: 'assets/icons/learning.svg',
                      ),
                    ),
                    SizedBox(height: 10),
                    LongPressPopupMenu(
                      child: Categorycontainer(
                        title: 'Progress',
                        backgroundAsset: 'assets/images/img_11.png',
                        svgAsset: 'assets/icons/progress.svg',
                      ),
                    ),
                    SizedBox(height: 80,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            TextFieldPopup.show(
                              context,
                              title: 'Create new Category',
                            );
                          },
                          child: Text(
                            'Add New Category',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: AppButtonStyle.elevatedButton(
                            AppColors.primary,
                            AppColors.transparent,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            TextFieldPopup.show(
                              context,
                              title: 'Create new Category',
                            );
                          },
                          child: Text(
                            'Add to Task',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: AppButtonStyle.elevatedButton(
                            AppColors.primary,
                            AppColors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: SvgPicture.asset(
                  'assets/icons/close.svg',
                  height: 24,
                  width: 24,
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
