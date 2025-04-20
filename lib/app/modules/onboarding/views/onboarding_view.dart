import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          TextButton(
            onPressed: controller.skip,
            child: Text("Skip",style: TextStyle(fontSize: 18,color: Colors.white),),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.onboardingData.length,
                itemBuilder: (context, index) {
                  final data = controller.onboardingData[index];
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image
                        Image.asset(
                          data['image']!,
                          height: 350,
                          width: 350,
                        ),
                        const SizedBox(height: 30),
                        Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            controller.onboardingData.length,
                                (dotIndex) => AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              width: controller.currentPage.value == dotIndex ? 10 :10,
                              height: 10,

                              decoration: BoxDecoration(
                                color: controller.currentPage.value == dotIndex
                                    ? Colors.white
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(5),

                              ),
                            ),
                          ),
                        )),
                        const SizedBox(height: 30),


                        Text(
                          data['title']!,
                          style: TextStyle(fontSize: 33.9, fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'Schuyler'),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),


                        Text(
                          data['subtitle']!,
                          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                          textAlign: TextAlign.center,
                        ),

                      ],
                    ),
                  );
                },
              ),
            ),


            Container(
              height: 60,
              width: 154,
              decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(16)
              ),
              child: Obx(()=>Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: controller.back, icon: Icon(Icons.arrow_back,
                      color: controller.currentPage.value ==0
                          ?Colors.white12
                          :Colors.white
                  )),
                  Text('|',style: TextStyle(color: Colors.white,fontSize: 30),),
                  IconButton(onPressed: controller.next, icon: Icon(Icons.arrow_forward,
                    color: Colors.white,
                    size: 24,
                  )),
                ],
              ),),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
