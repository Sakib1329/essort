import 'package:essort/app/modules/home/views/help&support.dart';
import 'package:essort/app/modules/home/views/homepage.dart';
import 'package:essort/app/modules/home/views/managesubscription.dart';
import 'package:essort/app/modules/home/views/personalinfo.dart';
import 'package:essort/app/modules/home/views/privacyandpolicy.dart';
import 'package:essort/app/modules/home/views/termsandcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../theme/colors.dart';
import '../../../widgets/dialogue.dart';
import '../controllers/home_controller.dart';

class Settingspage extends GetView<HomeController> {
  final HomeController controller = Get.find();

  Settingspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black, // or any background you use
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 30,
                color: AppColors.primary,
                fontFamily: 'Schuyler',
              ),
            ),
            const SizedBox(height: 50),

            // Switch Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notification',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 25,
                    )),
                Obx(() => CupertinoSwitch(
                  value: controller.isOn.value,
                  onChanged: (bool value) => controller.isOn.value = value,
                 thumbColor: AppColors.primary,

                activeTrackColor: AppColors.primary50,
                ),),
              ],
            ),
            const SizedBox(height: 10),

            _buildTile("Manage Subscription", Icons.arrow_forward_ios_outlined, onTap: () => Get.to(Managesubscriptionpage(),transition: Transition.rightToLeft)),
            _buildTile("Personal Information", Icons.arrow_forward_ios_outlined,onTap: () => Get.to(Personalinfo(),transition: Transition.rightToLeft)),
            _buildTile("Help & Support", Icons.arrow_forward_ios_outlined,onTap: () => Get.to(Helpsupport(),transition: Transition.rightToLeft)),
            _buildTile("Terms & Conditions", Icons.arrow_forward_ios_outlined,onTap: () => Get.to(Termsandcondition(),transition: Transition.rightToLeft)),
            _buildTile("Privacy Policy", Icons.arrow_forward_ios_outlined,onTap: () => Get.to(Privacyandpolicy(),transition: Transition.rightToLeft)),
            _buildTile("Delete my Data", Icons.delete_forever_outlined,
                iconColor: AppColors.white,onTap: () {
                Get.dialog(
                  CustomDialog(

                    title: "Are you sure you want to delete all your data?",

                    confirmText: "Yes",
                    hasTwoButtons: true,
                  ),
                );
              },),
            _buildTile("Log Out", Icons.logout,
                textColor: AppColors.brightred, iconColor: AppColors.brightred,onTap: () {
                Get.dialog(
                  CustomDialog(

                    title: "Do you really want to log out?",
                    hasTwoButtons: true,
                    confirmText: "Yes",
                  ),
                );
              },)
          ],
        ),
      ),
    );
  }

  Widget _buildTile(String title, IconData icon,
      {VoidCallback? onTap,Color textColor = Colors.white, Color iconColor = AppColors.primary}) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: onTap,
          splashColor: AppColors.primary,
          title: Text(
            title,
            style: TextStyle(color: textColor, fontSize: 20),
          ),
          trailing: Icon(icon, size: 18, color: iconColor),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
