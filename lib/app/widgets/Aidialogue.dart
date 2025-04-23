import 'package:essort/app/widgets/timepickerpopup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:essort/app/theme/colors.dart';
import 'package:essort/app/theme/button.dart';

import '../theme/textfield.dart';
import 'Customtextfiled2.dart';
import 'calender.dart';

void showSlidingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const _SlidingDialog(),
  );
}

class _SlidingDialog extends StatefulWidget {
  const _SlidingDialog({super.key});

  @override
  State<_SlidingDialog> createState() => _SlidingDialogState();
}

class _SlidingDialogState extends State<_SlidingDialog> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  void goToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() => currentPage = index);
  }

  void onActionPressed() {
    if (currentPage == 0) {
      goToPage(1);
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,         // Full width of the screen
        height: MediaQuery.of(context).size.height * 0.85, // 85% height of the screen
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Top Buttons
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (currentPage != 0) {
                            goToPage(0); // Go to page 0 if not already there
                          }
                        },
                        child: Text(
                          'Daily',
                          style: TextStyle(
                            color: currentPage == 0
                                ? AppColors.primary
                                : AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          if (currentPage != 1) {
                            goToPage(1); // Go to page 1 if not already there
                          }
                        },
                        child: Text(
                          'Unique',
                          style: TextStyle(
                            color: currentPage == 1
                                ? AppColors.primary
                                : AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Page View
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) => setState(() => currentPage = index),
                      children: [
                       const  _DialogPage1(),
                        const _DialogPage2(),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Bottom Action Button
                  ElevatedButton(
                    onPressed: onActionPressed,
                    style: AppButtonStyle.elevatedButton(AppColors.primary, AppColors.transparent),
                    child: Text('Update Task', style: const TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),

            // Close Button
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

class _DialogPage1 extends StatelessWidget {
  const _DialogPage1();

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              cursorColor: AppColors.primary,
              style: TextStyle(color: AppColors.white),
              decoration: AppInputDecoration.input3(hint: 'TASK TITLE'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: screenwidth * 0.3,
                  decoration: BoxDecoration(
                    color: AppColors.VerydarkGray,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.primary),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        QuickReminderPopup.show(context, title: 'Set Time');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Time',
                            style: TextStyle(color: AppColors.lightgray),
                          ),
                          SvgPicture.asset(
                            'assets/icons/time.svg',
                            height: 30,
                            width: 30,
                            colorFilter: const ColorFilter.mode(
                              AppColors.lightgray,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 40,
                  width: screenwidth * 0.35,
                  decoration: BoxDecoration(
                    color: AppColors.VerydarkGray,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.primary),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        QuickReminderPopup.show(context, title: 'Set Reminder');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reminder',
                            style: TextStyle(color: AppColors.lightgray),
                          ),
                          SvgPicture.asset(
                            'assets/icons/notification.svg',
                            height: 30,
                            width: 30,
                            colorFilter: const ColorFilter.mode(
                              AppColors.lightgray,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            LabeledExpandableTextField(istrue: false, hintText: 'Needs'),
          ],
        ),
      ),
    );
  }
}
class _DialogPage2 extends StatelessWidget {
   const _DialogPage2();

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomCalendar(),

            TextField(
              cursorColor: AppColors.primary,
              style: TextStyle(color: AppColors.white),
              decoration: AppInputDecoration.input3(hint: 'TASK TITLE'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: screenwidth * 0.3,
                  decoration: BoxDecoration(
                    color: AppColors.VerydarkGray,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.primary),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        QuickReminderPopup.show(context, title: 'Set Time');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Time',
                            style: TextStyle(color: AppColors.lightgray),
                          ),
                          SvgPicture.asset(
                            'assets/icons/time.svg',
                            height: 30,
                            width: 30,
                            colorFilter: const ColorFilter.mode(
                              AppColors.lightgray,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 40,
                  width: screenwidth * 0.35,
                  decoration: BoxDecoration(
                    color: AppColors.VerydarkGray,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.primary),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        QuickReminderPopup.show(context, title: 'Set Reminder');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reminder',
                            style: TextStyle(color: AppColors.lightgray),
                          ),
                          SvgPicture.asset(
                            'assets/icons/notification.svg',
                            height: 30,
                            width: 30,
                            colorFilter: const ColorFilter.mode(
                              AppColors.lightgray,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            LabeledExpandableTextField(istrue: false, hintText: 'Needs'),
          ],
        ),
      ),
    );
  }
}
