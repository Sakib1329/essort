import 'package:essort/app/modules/auth/views/resetpassword.dart';
import 'package:essort/app/modules/auth/views/signup.dart';
import 'package:essort/app/modules/auth/views/verifyemail.dart';
import 'package:essort/app/modules/home/views/nav.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/button.dart';
import '../../../theme/colors.dart';
import '../../../theme/textfield.dart';
import '../controllers/auth_controller.dart';

class Login extends GetView<AuthController> {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/img_1.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
        
            Text(
              'Log in',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w700,
                height: 1.7,
              ),
              textAlign: TextAlign.center,
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
        
                decoration: AppInputDecoration.input1(hint: 'Enter your password')
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding:  EdgeInsets.only(left: 270),
              child: InkWell(
                onTap: (){
                  Get.to(verify(),transition: Transition.rightToLeft);
        
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    height: 1.7,
                  ),
        
                ),
              ),
            ),
            SizedBox(height: 30),
        
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: OutlinedButton(
                onPressed: () {
                  Get.to(HomeView(),transition: Transition.rightToLeft);

                },
                style: AppButtonStyle.outlined(AppColors.black,AppColors.darkBackground),
                child: Text(
                  'Log in',
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  Text(
                    'I dont have a account ',
                    style: TextStyle(fontSize: 15, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(signup(),transition: Transition.rightToLeft);
                    },
                    child: Text(
                      'Sign up',
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
                    'By Log in, You’re agree to our',
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
                  ElevatedButton(
                    onPressed: () {
                      print('Facebook button pressed!');
                    },
                    style:AppButtonStyle.elevatedButton(AppColors.gmailRed40,AppColors.transparent),
                    child: Text(
                      'Google',
                      style: TextStyle(
                        color: AppColors.gmailRed, // your custom color
                        fontSize: 20,
        
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: () {
                      print('Facebook button pressed!');
                    },
                    style:AppButtonStyle.elevatedButton(AppColors.facebookBlue40,AppColors.transparent),
                    child: Text(
                      'Facebook',
                      style: TextStyle(
                        color: AppColors.facebookBlue, // your custom color
                        fontSize: 20,
        
                      ),
                    ),
                  )
        
        
                ]
            ),
        
          ],
        ),
      ),
    );
  }
}
