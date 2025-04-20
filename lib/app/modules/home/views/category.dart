import 'package:essort/app/theme/button.dart';
import 'package:essort/app/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class Categorypage extends GetView<HomeController> {
  const Categorypage({super.key});
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
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(

        mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Category',
              style: TextStyle(fontSize: 25,color: AppColors.primary,fontFamily: 'Schuyler'),
            ),
            SizedBox(
              width: 130,
              child: Divider(color: AppColors.primary,
                thickness: 1,),
            ),
            SizedBox(
              width: 130,
              height: 1,
              child: Divider(color: AppColors.primary,indent: 60,
                thickness: 1,),
            ),
           SizedBox(height: 20,),
           Container(
               width: 400,
               height: 70,
               decoration: BoxDecoration(
                 image: DecorationImage(image: AssetImage( 'assets/images/img_3.png'),fit: BoxFit.fill)
               ),


           ),
            SizedBox(height: 10,),
            Container(
              width: 400,
              height: 70,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage( 'assets/images/img_4.png'),fit: BoxFit.fill)
              ),


            ),
            SizedBox(height: 10,),
            Container(
              width: 400,
              height: 70,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage( 'assets/images/img_5.png'),fit: BoxFit.fill)
              ),


            ),
            SizedBox(height: 10,),
            Container(
              width: 400,
              height: 70,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage( 'assets/images/img_6.png'),fit: BoxFit.fill)
              ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                ElevatedButton(onPressed: (){}, child: Text('Add New Section',style: TextStyle(color: Colors.white),),
                style: AppButtonStyle.elevatedButton(AppColors.primary),),
              ],
            ),
            SizedBox(height: 10,)

          ],
        ),
      ),
    );
  }
}
