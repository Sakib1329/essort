import 'package:essort/app/modules/auth/views/OTP.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/button.dart';
import '../../../theme/colors.dart';
import '../../../theme/textfield.dart';
import '../controllers/auth_controller.dart';

class verify extends GetView<AuthController> {
  const verify({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 200,),
            Text(
              'Verify',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w700,
                height: 1.7,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 80,),
            Padding(
              padding:  EdgeInsets.only(left: 30),
              child: Text(
                'Email',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  height: 1.7,
                ),

              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                  cursorColor: AppColors.primary,
                  style: TextStyle(color: Colors.white),

                  decoration: AppInputDecoration.input1(hint: 'Enter your email')
              ),
            ),
            SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: OutlinedButton(
                onPressed: () {

                  Get.to(otp(),transition: Transition.rightToLeft);
                },
                style:  AppButtonStyle.outlined(AppColors.black,AppColors.darkBackground),
                child: Text(
                  'OTP',
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 10),

          ],
        ),
      ),
    );
  }
}
