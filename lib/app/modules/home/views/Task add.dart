import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:essort/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class TaskAdd extends GetView<HomeController> {
  const TaskAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() => CalendarDatePicker2(

            config:  CalendarDatePicker2Config(
              calendarType: CalendarDatePicker2Type.single,
              selectedDayHighlightColor: AppColors.primary,

              weekdayLabelTextStyle: const TextStyle(color: Colors.grey),
              dayTextStyle: const TextStyle(color: Colors.white,fontSize: 20),
              selectedDayTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              controlsTextStyle: const TextStyle(color: Colors.white),
            ),
            value: controller.dates,
            onValueChanged: (dates) => controller.updateDates(dates),
          )),
        ),
      ),
    );
  }
}
