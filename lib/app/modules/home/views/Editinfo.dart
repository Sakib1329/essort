import 'dart:io';
import 'package:essort/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/button.dart';
import '../../../theme/colors.dart';
import '../../../theme/textfield.dart';
import '../../../widgets/Customtextfield.dart';
import '../controllers/bottomsheet+image.dart';


class Editinfo extends StatelessWidget {
  Editinfo({super.key});

  final BottomSheetController bs = Get.find();
  final HomeController controller = Get.find();
  final TextEditingController biocontroller=TextEditingController();
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

              Text("Personal Information",style: TextStyle(
                  color: AppColors.white,
                  fontSize: 25
              ),),
              SizedBox(height: 30,),
              // Profile Avatar Section
              Row(

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
                  const SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 90),
                        child: Text("Mira", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color:  AppColors.white)),
                      ),
                      const SizedBox(height: 4),
                      Row(


                        children: [
                          Text("Bio :", style: TextStyle(fontSize: 16, color:  AppColors.white)),
                          SizedBox(width: 15,),
                          SizedBox(
                            width: 180,
                            height: 40,
                            child: TextField(
                                cursorColor: AppColors.primary,

                                style: const TextStyle(color: AppColors.white,fontSize: 10),
                                controller: biocontroller,
                                decoration: AppInputDecoration.input1(hint: '')
                            ),
                          ),
                        ],
                      ),
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
              const SizedBox(height: 20),

              /// Email (readonly)
              CustomTextFieldForSetting(
                label: "Email",
                hintText: "abc@gmail.com",
                controller: emailController,
                isEditable: false,

                isPassword: false,
              ),

              const SizedBox(height: 20),

              /// Birthday
              SizedBox(
                width: 200,
                child: CustomTextFieldForSetting(
                  label: "Birthday",
                  hintText: "DD/MM/YY",
                  controller: birthdayController,
                  isPassword: false,
                  isEditable: false,
                  suffixIconPath: "assets/icons/calender.svg",
                  onSuffixTap: () {},
                ),
              ),
              SizedBox(height: 150,),
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
