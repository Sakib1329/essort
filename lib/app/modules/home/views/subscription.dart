import 'package:essort/app/modules/home/controllers/radiocontroller.dart';
import 'package:essort/app/theme/button.dart';
import 'package:essort/app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/dialogue2.dart';
import '../../../widgets/radiolisttile.dart';
import '../controllers/home_controller.dart';

class Subscription extends GetView<HomeController> {
  const Subscription({super.key});
  @override
  Widget build(BuildContext context) {
    final List<String> options = ['Monthly', 'Lifetime', 'Yearly'];
final HomeController controller=Get.find();
    return Scaffold(
     resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios,color: AppColors.white,)),

        title: Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('SonicAi',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
              SizedBox(width: 5,),
              Container(
                height: 30,
                width: 50,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text('PRO',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),)),
              )
            ],
          ),
        ),
      ),

      body:
      SingleChildScrollView(
        child: Container(
          width: double.infinity,
        decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
          Color(0xFF79A78D),
            Color(0xFF79A78D),
            Color(0xFF161616),
            Color(0xFF161616),
            ],
        
            stops: [0.0, 0.3, 0.48, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            ),
            ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      "Try Sonic AI Premium Features",
                      style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
        
                    height: 270,
        
                    decoration: BoxDecoration(
                        color: Colors.black45,
                      border: Border.all(
                        color: AppColors.white50,
                        width: 2
                      ),
                      borderRadius: BorderRadius.circular(20)
        
                    ),
                    child:Obx(()=>Column(

                      children: [
                        SubscriptionOptionTile(
                          value: 0,
                          groupValue: controller.selectedOption.value,
                          onChanged: controller.setOption,
                          title: 'Monthly', subtitle: '\$9.99/month',
                          istrue: false,
                        ),
                        Divider(color: Colors.white24, thickness: 1),
                        SubscriptionOptionTile(
                          value: 1,
                          groupValue: controller.selectedOption.value,
                          onChanged: controller.setOption,
                          title: 'Lifetime', subtitle: '\$24.99',
                          istrue: true,
                        ),
                        Divider(color: Colors.white24, thickness: 1),
                        SubscriptionOptionTile(
                          value: 2,
                          groupValue: controller.selectedOption.value,
                          onChanged: controller.setOption,
                          title: 'Yearly', subtitle: '\$79.99/year',
                          istrue: false,
                        ),
                      ],
                    ))
                  ),
                  SizedBox(height: 15,),
                  Center(
                    child: Text(
                      "WHATS INCLUDED",
                      style: TextStyle(color: AppColors.white50, fontSize: 20,fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(height: 5,),
                  SizedBox(
        
                      height: 300,
                      child: Image.asset('assets/images/img_9.png')),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CustomDialogWidget(
                          svgPath: 'assets/icons/celebrations.svg',
                          title: 'Upgraded to Sonic AI Pro!',
                          subtitle: 'Congratulations! You\'ve successfully upgraded to Sonic AI Pro. Enjoy enhanced features',
                          buttonText: 'Explore',
                          onButtonPressed: () => Navigator.of(context).pop(),
                        );
                      },
                    );

                  },
                      style:AppButtonStyle.elevatedButton(AppColors.primary,AppColors.transparent),child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.gift_fill,color: Colors.white,size: 30,),
                      SizedBox(width: 2,),
                      Text('Free Trial',style: TextStyle(color: Colors.white,fontSize: 20),)
                    ],
                  )),
                  SizedBox(height: 10,),
                  Text(
                    "3 day free trial, then  \$19.99 / year. Cancel anytime.",
                    style: TextStyle(color: AppColors.white50, fontSize: 15,fontWeight: FontWeight.w300),textAlign: TextAlign.center,
                  ),
                ],
                
              ),
            ),
          ),
        ),
      ),
    );
  }
}
