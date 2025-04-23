import 'package:essort/app/theme/button.dart';
import 'package:essort/app/theme/textfield.dart';
import 'package:essort/app/widgets/popupmenubutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';
import '../../../widgets/Customtextfiled2.dart';
import '../../../widgets/dialogue3.dart';
import '../../../widgets/dialogue4.dart';
import '../controllers/home_controller.dart';

class Categoryinfoupdate extends GetView<HomeController> {
  const Categoryinfoupdate({super.key});

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
              'Untitled',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontFamily: 'Schuyler',
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 400,
              width: 100,

              child: Stack(
                children: [
                  TextField(
                    style: TextStyle(),
                    expands: true,
                    maxLines: null,
                    minLines: null,
                    textAlignVertical: TextAlignVertical.top,
                    cursorColor: AppColors.primary,
                    decoration: AppInputDecoration.input1(hint: 'I\'ve meeting with Pial at 9 a.m. So I have to wake up earliar'),


                  ),
                  Positioned(
                    right: 1,
                    top: 8,
                    child: TaskPopupMenu(
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
