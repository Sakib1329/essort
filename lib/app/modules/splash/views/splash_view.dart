import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
final SplashController controller=Get.put(SplashController());
   SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

      children: [

         Padding(
           padding: const EdgeInsets.symmetric(vertical: 285.0),
           child: Center(
            child:  Container(
              width: 250,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/esort.png'))
            ),


            ),

                   ),
         ),

        Padding(
          padding: const EdgeInsets.only(left:150.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text('Version 1.0',style: TextStyle(color: AppColors.darkGray,fontSize: 18),),
              SizedBox(width: 50,),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/11.png'))
                ),


              ),
            ],
          ),
        )
      ],
      )

    );
  }
}
