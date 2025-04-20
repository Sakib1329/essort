import 'package:essort/app/modules/home/views/Task%20add.dart';
import 'package:essort/app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../theme/button.dart';
import '../../../theme/textfield.dart';
import '../../../widgets/Customtextfiled2.dart';
import '../../../widgets/dialogue2.dart';
import '../../../widgets/radiocontainer.dart';
import '../controllers/home_controller.dart';

class Homepage extends GetView<HomeController> {
  final HomeController controller=Get.find();
   Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF1E1E1E),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            border: Border(
              bottom: BorderSide(
                color: AppColors.primary,
                width: 1,
              ),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/imgg.jpg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hello Joshita",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "I am worth of love and respect",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/thunder.svg',
                  height: 30,
                  width: 30,
                  color: AppColors.lightgray,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/bellicon.svg',
                  height: 30,
                  width: 30,
                    color: AppColors.lightgray,
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 25),
          child: Obx(()=> Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/img_11.png'),

                  Positioned(
                    top: 20,
                    right: 8,
                    child: Image.asset(
                      'assets/images/img_12.png',
                      height: 50,
                    ),
                  ),
                  Positioned(
                      top: 20,
                      left: 30,
                      child: Text('Budget',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
                  ),
                  Positioned(
                      top: 20,
                      right: 40,
                      child: Text('\$5000',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
                  ),

                ],
              ),
              SizedBox(height: 20,),
              LabeledExpandableTextField(
                label: 'Create Notes',
                svgPath: 'assets/icons/savedisk.svg',
                hintText: 'Type your Note',

              ),
              SizedBox(height: 15,),
              LabeledExpandableTextField(
                label: 'Daily Needs',
                svgPath: 'assets/icons/Ai2.svg',
                hintText: 'I need milk for  breakfast',
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Text(
                    'Daily Tasks',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],

              ),
              Hometile(
                value: 0,
                groupValue: controller.selectedOption.value,
                onChanged: controller.setOption,
              
                category: 'Breakfast',
                amount: '5000',
                time: '5.30',

              ),
              Hometile(
                value: 1,
                groupValue: controller.selectedOption.value,
                onChanged: controller.setOption,
              
                category: 'Workout',
                amount: '5000',
                time: '5.30',

              ),
              Hometile(
                value: 2,
                groupValue: controller.selectedOption.value,
                onChanged: controller.setOption,

                category: 'Marketing',
                amount: '5000',
                time: '5.30',

              ),
              Hometile(
                value: 3,
                groupValue: controller.selectedOption.value,
                onChanged: controller.setOption,

                category: 'Breakfast',
                amount: '5000',
                time: '5.30',

              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
     Get.to(TaskAdd(),transition: Transition.downToUp);
              },
                  style:AppButtonStyle.elevatedButton(AppColors.primary),child: Text('Create New Task',style: TextStyle(color: Colors.white,fontSize: 20),)),




            ],
          ),)
        ),
      ),
    );
  }
}
