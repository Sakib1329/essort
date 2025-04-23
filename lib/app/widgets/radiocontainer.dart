import 'package:essort/app/modules/home/views/Task%20add.dart';
import 'package:essort/app/theme/colors.dart';
import 'package:essort/app/widgets/popupmenubutton.dart';
import 'package:essort/app/widgets/timepickerpopup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Hometile extends StatelessWidget {
  final int value;
  final int groupValue;
  final void Function(int?) onChanged;
  final String category;
  final String amount;
  final String time;

  const Hometile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.category,
    required this.amount,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
      child: GestureDetector(
        onTap: () => onChanged(value),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2B2B2B), // background color for the tile
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              // Custom circular indicator
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                child: isSelected
                    ? Center(
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                  ),
                )
                    : null,
              ),
              SizedBox(width: 20,),
              // Text content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(category, style: const TextStyle(color: Colors.white, fontSize: 18)),
                    const SizedBox(height: 4),
                    Text('\$ $amount', style: const TextStyle(color: Colors.white, fontSize: 16)),
                    const SizedBox(height: 2),
                    Text('Time: $time', style: const TextStyle(color: Colors.white70, fontSize: 14)),
                  ],
                ),
              ),
              TaskPopupMenu(
                ismoriz: true,
                onEdit: () {
                  // Edit logic
                },
                onNotify: () {
                  QuickReminderPopup.show(context,title: 'Would you like set an alarm?');
                },
                onDelete: () {
                 Get.to(TaskAdd(),transition: Transition.downToUp);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
