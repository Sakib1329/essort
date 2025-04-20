import 'package:essort/app/theme/button.dart';
import 'package:essort/app/theme/textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../widgets/dialogue.dart';
import '../controllers/home_controller.dart';

class Helpsupport extends GetView<HomeController> {
  const Helpsupport({super.key});
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
                'Help & Support',
                style: TextStyle(fontSize: 25,color: Colors.white,fontFamily: 'Schuyler'),
              ),
              SizedBox(height: 60,),
              Text(
                'Describe Your Problem ',
                style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 20,),
              Container(
                height: 400,
                width: 100,

                child: TextField(
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  textAlignVertical: TextAlignVertical.top,
                  cursorColor: AppColors.primary,
                  decoration: AppInputDecoration.input1(),


                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                Get.dialog(
                  CustomDialog(

                    title: "We are deeply sorry for the problem you are facing. We have received your message. We will contact you via email very soon.",
                    hasTwoButtons: false,
                    confirmText: "Cool",
                    type: DialogType.profile,
                  ),
                );


              },
                  style: AppButtonStyle.elevatedButton( AppColors.primary),
                  child:Text('Send',style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Schuyler'),) ),



            ],
          ),
        ),
      ),
    );
  }
}
