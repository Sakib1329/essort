import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:essort/app/theme/colors.dart';
import 'package:essort/app/theme/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../theme/button.dart';
import '../../../widgets/Customtextfiled2.dart';
import '../../../widgets/calender.dart';
import '../../../widgets/timepickerpopup.dart';
import '../controllers/home_controller.dart';

class TaskAdd extends GetView<HomeController> {
   TaskAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios, color: AppColors.primary),
            ),
            Text(
              'Back',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        leadingWidth: 150,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,),
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
mainAxisAlignment:MainAxisAlignment.spaceBetween,

                children: [
                  Container(
                    height: 40,
                    width: screenwidth*0.46,
                    decoration: BoxDecoration(
                      color: AppColors.VerydarkGray,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.primary),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: (){
                          QuickReminderPopup.show(context,title: 'Set Time');
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
                    width: screenwidth*0.46,
                    decoration: BoxDecoration(
                      color: AppColors.VerydarkGray,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.primary),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: (){
                          QuickReminderPopup.show(context,title: 'Set Reminder');
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
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Get.to(TaskAdd(), transition: Transition.downToUp);
                },
                style: AppButtonStyle.elevatedButton(AppColors.primary,AppColors.transparent),
                child: Text(
                  'Edit',
                  style: TextStyle(color: AppColors.white, fontSize: 20),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Get.to(TaskAdd(), transition: Transition.downToUp);
                },
                style: AppButtonStyle.elevatedButton(AppColors.transparent,AppColors.primary),
                child: Text(
                  'Done',
                  style: TextStyle(color: AppColors.primary, fontSize: 20),
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
