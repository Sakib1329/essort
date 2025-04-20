import 'package:essort/app/modules/auth/views/login.dart';
import 'package:essort/app/theme/colors.dart';
import 'package:essort/app/theme/textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class signup extends GetView<AuthController> {
  const signup({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 100),
            Padding(
              padding:  EdgeInsets.only(left: 30),
              child: Text(
                'Name',
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

                decoration: AppInputDecoration.input1(hint: 'Enter your name')
              ),
            ),
            SizedBox(height: 20),
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
            SizedBox(height: 20),
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

                decoration:  AppInputDecoration.input1(hint: 'Enter your password')
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
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.white12,
                  side: BorderSide(color: Colors.black),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  Text(
                    'I have a account ',
                    style: TextStyle(fontSize: 15, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(Login(),transition: Transition.rightToLeft);
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(fontSize: 15, color: Colors.green),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding:  EdgeInsets.only(left: 40),
              child: Wrap(
                children: [
                  Text(
                    'By Sign Up, You’re agree to our',
                    style: TextStyle(fontSize: 15, color: Colors.white70),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      ' Terms & Condition',
                      style: TextStyle(fontSize: 15, color: Colors.green),
                    ),
                  ),
                  Text(
                    ' and',
                    style: TextStyle(fontSize: 15, color: Colors.white70),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Privacy policy',
                      style: TextStyle(fontSize: 15, color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30,),
            Text('Continue With Accounts',style: TextStyle(fontSize: 20,color: Colors.white70),textAlign: TextAlign.center,),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Container(
                  height: 57,
                  width: 165,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0x40D44638),
                  ),
                  child: Center(
                    child: Text(
                      'Google',
                      style: TextStyle(color: Color(0x40D44638), fontSize: 20),
                    ),
                  ),
                ),

                SizedBox(width: 20),
                Container(
                  height: 57,
                  width: 165,

                  decoration: BoxDecoration(
                    color: Color(0x404267B2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Facebook',
                      style: TextStyle(color: Color(0xFF4267B2), fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
