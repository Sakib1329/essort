import 'package:essort/app/modules/auth/views/login.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/button.dart';
import '../../../theme/colors.dart';
import '../../../theme/textfield.dart';
import '../controllers/auth_controller.dart';

class resetpass extends GetView<AuthController> {
  const resetpass({super.key});
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
              'Reset Password',
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
                'Password',
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

                  decoration:  AppInputDecoration.input1(hint: 'Enter your new password')
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding:  EdgeInsets.only(left: 30),
              child: Text(
                'Confirm Password',
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

                  decoration:  AppInputDecoration.input1(hint: 'Confirm your password')
              ),
            ),
            SizedBox(height: 5,),




            SizedBox(height: 30),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: OutlinedButton(
                onPressed: () {
                  Get.to(Login(),transition: Transition.rightToLeft);

                },
                style:  AppButtonStyle.outlined(AppColors.black,AppColors.darkBackground),
                child: Text(
                  'Set Password',
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
