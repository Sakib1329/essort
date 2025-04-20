import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';
import '../../../widgets/Customtextfield.dart';
import '../controllers/bottomsheet+image.dart';

import '../controllers/personalinfocontroller.dart'; // <--- add this

class Personalinfo extends StatelessWidget {
  Personalinfo({super.key});

  final BottomSheetController bs = Get.find();
  final PersonalInfoController controller = Get.find();

  final TextEditingController nameController = TextEditingController(text: "Mira");
  final TextEditingController emailController = TextEditingController(text: "abc@gmail.com");
  final TextEditingController passwordController = TextEditingController(text: "********");
  final TextEditingController birthdayController = TextEditingController(text: "DD/MM/YY");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back_ios, color: AppColors.primary),
            ),
            Text(
              'Back',
              style: TextStyle(color: AppColors.primary, fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        leadingWidth: 150,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Profile Avatar Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white24,
                        child: Obx(() => bs.pickedImagePath.value == ''
                            ? const Icon(Icons.person, size: 60, color: Colors.white)
                            : ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.file(
                            File(bs.pickedImagePath.value),
                            fit: BoxFit.cover,
                            height: 120,
                            width: 120,
                          ),
                        )),
                      ),
                      Positioned(
                        bottom: -10,
                        right: -5,
                        child: IconButton(
                          icon: Icon(Icons.camera_alt_outlined, size: 18, color: AppColors.primary),
                          onPressed: bs.getBottomSheet,
                          padding: const EdgeInsets.all(4),
                          constraints: const BoxConstraints(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Mira", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:  AppColors.primary)),
                      SizedBox(height: 4),
                      Text("Bio:", style: TextStyle(fontSize: 14, color:  AppColors.primary)),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// Editable Name Field
              Obx(() => CustomTextFieldForSetting(
                label: "Name",
                hintText: "Mira",
                controller: nameController,
                suffixIconPath: "assets/icons/edit.svg",
                onSuffixTap: controller.toggleNameEdit,
                isEditable: controller.isNameEditable.value,
                isPassword: false,
              )),
              const SizedBox(height: 10),

              /// Email (readonly)
              CustomTextFieldForSetting(
                label: "Email",
                hintText: "abc@gmail.com",
                controller: emailController,
                isEditable: false,

                isPassword: false,
              ),

              const SizedBox(height: 10),

              /// Editable Password Field
              Obx(() => CustomTextFieldForSetting(
                label: "Password",
                hintText: "********",
                controller: passwordController,
                isPassword: true,
                suffixIconPath: "assets/icons/edit.svg",
                isEditable: controller.isPasswordEditable.value,
                onSuffixTap: controller.togglePasswordEdit,
              )),

              const SizedBox(height: 10),

              /// Birthday
              CustomTextFieldForSetting(
                label: "Birthday",
                hintText: "DD/MM/YY",
                controller: birthdayController,
                isPassword: false,
                isEditable: false,
                width: 200,
                suffixIconPath: "assets/icons/calender.svg",
                onSuffixTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
