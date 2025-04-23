import 'package:essort/app/modules/home/views/categoryinfoupdate.dart';
import 'package:essort/app/theme/button.dart';
import 'package:essort/app/widgets/popupmenubutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';
import '../../../widgets/dialogue3.dart';
import '../../../widgets/dialogue4.dart';
import '../controllers/home_controller.dart';

class Categorydescription extends GetView<HomeController> {
  const Categorydescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios, color: AppColors.primary),
            ),
            Text(
              'Back',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Agenda',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontFamily: 'Schuyler',
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Get.to(Categoryinfoupdate(),transition: Transition.rightToLeft);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.VerydarkGray,// custom dark background
                        borderRadius: BorderRadius.circular(12),

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 100.0),
                              child: Text(
                                'I\'ve meeting with Pial at 9 a.m. So I have to wake up earliar',
                                style: const TextStyle(color: Colors.white, fontSize: 20),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                          TaskPopupMenu(
                            ismoriz: false,
                            onEdit: (){
                              showDialog(
                                context: context,
                                builder: (_) => MessageDialog(
                                  message: 'Do you want to delete the note?',
                                  onPressed: () {
                                    // your action
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                            onNotify: (){
                              TextFieldPopup.show(
                                context,
                                title: 'Rename this Note',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
