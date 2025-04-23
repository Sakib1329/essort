import 'dart:io';
import 'package:essort/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/button.dart';
import '../../../theme/colors.dart';
import '../../../widgets/Customtextfield.dart';
import '../controllers/bottomsheet+image.dart';


class Editpass extends StatelessWidget {
  Editpass({super.key});

  final BottomSheetController bs = Get.find();
  final HomeController controller = Get.find();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();

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
              SizedBox(height: 20,),
              Text("Password Reset",style: TextStyle(
                color: AppColors.white,
                fontSize: 25
              ),),
              SizedBox(height: 30,),
              Obx(() => CustomTextFieldForSetting(
                label: "Old Password",
                hintText: "********",
                controller: passwordController,
                isPassword: true,
                suffixIconPath: "assets/icons/edit.svg",
                isEditable: controller.isPasswordEditable.value,
                onSuffixTap: controller.togglePasswordEdit,
              )),

              const SizedBox(height: 20),
              Obx(() => CustomTextFieldForSetting(
                label: "New Password",
                hintText: "********",
                controller: passwordController,
                isPassword: true,
                suffixIconPath: "assets/icons/edit.svg",
                isEditable: controller.isPasswordEditable.value,
                onSuffixTap: controller.togglePasswordEdit,
              )),

              const SizedBox(height: 20),
              /// Editable Password Field
              Obx(() => CustomTextFieldForSetting(
                label: "Confirm Password",
                hintText: "********",
                controller: passwordController,
                isPassword: true,
                suffixIconPath: "assets/icons/edit.svg",
                isEditable: controller.isPasswordEditable.value,
                onSuffixTap: controller.togglePasswordEdit,
              )),
              SizedBox(height: 240,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  OutlinedButton(onPressed: (){

                  },
                      style: AppButtonStyle.outlined(AppColors.transparent, AppColors.primary),
                      child:Text('Save',style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Schuyler'),) ),
                  SizedBox(height: 20,),
                  OutlinedButton(onPressed: (){},
                      style: AppButtonStyle.outlined(AppColors.primary, AppColors.black),
                      child:Text('Cancel',style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Schuyler'),) ),
                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}
