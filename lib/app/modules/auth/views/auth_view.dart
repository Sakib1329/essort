import 'package:essort/app/modules/auth/views/login.dart';
import 'package:essort/app/modules/auth/views/signup.dart';
import 'package:essort/app/routes/app_pages.dart';
import 'package:essort/app/theme/button.dart';
import 'package:essort/app/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 70,),
        Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/img_1.png'),fit: BoxFit.fill)
            ),
          ),
        ),
            SizedBox(height: 50,),
            Text('Welcome to\neSort',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w700,height: 1.7),textAlign: TextAlign.center,),
            SizedBox(height: 50,),
        
            Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: OutlinedButton(onPressed: (){

     Get.to(Login(),transition:Transition.rightToLeft);

          },  style: AppButtonStyle.outlined(AppColors.black,AppColors.darkBackground),
              child: Text('Log in',style: TextStyle(color: Colors.white,fontSize: 20),)),
        ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: OutlinedButton(onPressed: (){
                Get.to(signup(),transition: Transition.rightToLeft);

              },
                  style: AppButtonStyle.outlined(AppColors.black,AppColors.darkBackground),
                  
               child: Text('Sign Up',style: TextStyle(color: AppColors.lightgray,fontSize: 20),)),
              
            ),
            SizedBox(height: 20,),
            Text('Continue With Accounts',style: TextStyle(fontSize: 20,color: AppColors.softGray),textAlign: TextAlign.center,),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
        
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Facebook button pressed!');
                  },
                  style:AppButtonStyle.elevatedButton(AppColors.gmailRed40),
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
                  style:AppButtonStyle.elevatedButton(AppColors.facebookBlue40),
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
            SizedBox(height: 80,)

          ],
        ),
      ),
    );
  }
}
