import 'package:essort/app/modules/home/views/Ai.dart';
import 'package:essort/app/modules/home/views/category.dart';
import 'package:essort/app/modules/home/views/homepage.dart';
import 'package:essort/app/modules/home/views/settings.dart';
import 'package:essort/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController controller=Get.find();
   HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return [
          Homepage(),
          Categorypage(),
          Aipage(),
          Settingspage(),
        ]
        [controller.currentIndex.value];
      }),
      bottomNavigationBar: Obx(() => Container(
        height: 100,
        decoration: BoxDecoration(color: AppColors.VerydarkGray,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
            boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10),
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            final isSelected = controller.currentIndex.value == index;
            return GestureDetector(
              onTap: () => controller.currentIndex.value = index,
              child: Container(
                width: 65,
                height: 62,
                decoration: BoxDecoration(
                 border: Border.all(
                   color: isSelected ? AppColors.primary : Colors.transparent,
                   width: 2
                 ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      [
                        'assets/icons/home.svg',
                        'assets/icons/category.svg',
                        'assets/icons/ai.svg',
                        'assets/icons/settings.svg',
                      ][index],

                      colorFilter: ColorFilter.mode(
                        isSelected ? Colors.white : AppColors.secondary,
                        BlendMode.srcIn,
                      ),
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      [
                        'Home',
                        'Category',
                        'Ai',
                        'Settings',
                      ][index],
                      style: TextStyle(
                        fontSize: 12,
                        color: isSelected ? Colors.white : AppColors.secondary,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),

              ),
            );
          }),
        ),
      )),
    );
  }
}
