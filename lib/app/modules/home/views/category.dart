import 'package:essort/app/theme/button.dart';
import 'package:essort/app/theme/colors.dart';
import 'package:essort/app/widgets/popupmenuButton2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/categorycontainer.dart';
import '../../../widgets/dialogue3.dart';
import '../../../widgets/dialogue4.dart';
import '../controllers/home_controller.dart';
import 'Task add.dart';

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
            LongPressPopupMenu(
onDelete: (){
  showDialog(
    context: context,
    builder: (_) => MessageDialog(
      message: 'Are you sure you want to delete this item?',
      onPressed: () {
        // your action
        Navigator.pop(context);
      },
    ),
  );


},
              onRename: (){
                TextFieldPopup.show(
                  context,
                  title: 'Rename the Category',
                );


              },
              child: Categorycontainer(
                  title: 'Agenda',

                  backgroundAsset: 'assets/images/img_14.png',
                svgAsset: 'assets/icons/agenda.svg',
              ),
            ),
            SizedBox(height: 10,),
            LongPressPopupMenu(
              child: Categorycontainer(
                title: 'Creativity',

                backgroundAsset: 'assets/images/img_15.png',
                svgAsset: 'assets/icons/creativity.svg',
              ),
            ),
            SizedBox(height: 10,),
            LongPressPopupMenu(
              child: Categorycontainer(
                title: 'Learning',

                backgroundAsset: 'assets/images/img_16.png',
                svgAsset: 'assets/icons/learning.svg',
              ),
            ),
            SizedBox(height: 10,),
            LongPressPopupMenu(
              child: Categorycontainer(
                title: 'Progress',

                backgroundAsset: 'assets/images/img_11.png',
                svgAsset: 'assets/icons/progress.svg',
              ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                ElevatedButton(onPressed: (){}, child: Text('Add New Section',style: TextStyle(color: Colors.white),),
                style: AppButtonStyle.elevatedButton(AppColors.primary,AppColors.transparent),),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){}, child: Text('Add New Section',style: TextStyle(color: Colors.white),),
                  style: AppButtonStyle.elevatedButton(AppColors.primary,AppColors.transparent),),
              ],
            ),
            SizedBox(height: 10,)

          ],
        ),
      ),
    );
  }
}
