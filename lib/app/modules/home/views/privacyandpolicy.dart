import 'package:essort/app/theme/button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../controllers/home_controller.dart';

class Privacyandpolicy extends GetView<HomeController> {
  const Privacyandpolicy({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        leading: Row(
          children: [
            IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.arrow_back_ios,color: AppColors.primary,)),
            Text('Back',style: TextStyle(color: AppColors.primary,fontSize: 22,fontWeight: FontWeight.bold),),
          ],
        ),
        leadingWidth: 150,

      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Privacy & Policy',
                style: TextStyle(fontSize: 25,color: Colors.white,fontFamily: 'Schuyler'),
              ),
              SizedBox(height: 20,),
              Container(
                width: 400,
                height: 650,
                decoration: BoxDecoration(
        
        
                  image: DecorationImage(image: AssetImage('assets/images/img_7.png'),fit: BoxFit.fill)
        
                ),
        
              ),
        
        
            ],
          ),
        ),
      ),
    );
  }
}
