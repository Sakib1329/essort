import 'package:essort/app/modules/home/views/subscription.dart';
import 'package:essort/app/theme/button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../controllers/home_controller.dart';

class Managesubscriptionpage extends GetView<HomeController> {
  const Managesubscriptionpage({super.key});
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

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Manage Subscription',
              style: TextStyle(fontSize: 25,color: Colors.white,fontFamily: 'Schuyler'),
            ),
            SizedBox(height: 20,),
            Container(
              width: 400,
              height: 280,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30)

              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Bill No :',
                          style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'Schuyler',fontWeight: FontWeight.w700),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          '1235',
                          style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'Trajan Pro',fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Text(
                          'Username :',
                          style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'Schuyler',fontWeight: FontWeight.w700),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          '1235',
                          style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'Trajan Pro',fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Text(
                          'Purchase date :',
                          style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'Schuyler',fontWeight: FontWeight.w700),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          '1235',
                          style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'Trajan Pro',fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Text(
                          'Subscription Type :',
                          style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'Schuyler',fontWeight: FontWeight.w700),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          '1235',
                          style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'Trajan Pro',fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Text(
                          'Subscription Amount :',
                          style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'Schuyler',fontWeight: FontWeight.w700),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          '1235',
                          style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'Trajan Pro',fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Text(
                          'Expire Date :',
                          style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'Schuyler',fontWeight: FontWeight.w700),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          '1235',
                          style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'Trajan Pro',fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),

                  ],


                ),
              ),
            ),
            SizedBox(height: 30,),
            OutlinedButton(onPressed: (){
              Get.to(Subscription(),transition: Transition.rightToLeft);
            },
                style: AppButtonStyle.outlined(AppColors.transparent, AppColors.primary),
                child:Text('Update',style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Schuyler'),) ),
            SizedBox(height: 20,),
            OutlinedButton(onPressed: (){},
                style: AppButtonStyle.outlined(AppColors.primary, AppColors.black),
                child:Text('Cancel',style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Schuyler'),) ),

          ],
        ),
      ),
    );
  }
}
