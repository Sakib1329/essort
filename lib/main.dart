import 'package:essort/app/modules/home/controllers/bottomsheet+image.dart';
import 'package:essort/app/modules/home/controllers/home_controller.dart';
import 'package:essort/app/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put(HomeController());
  Get.put(BottomSheetController());

  runApp(
    GetMaterialApp(
     theme: ThemeData(
       scaffoldBackgroundColor: Colors.black,
       splashColor: AppColors.transparent,

       appBarTheme: AppBarTheme(
         color: Colors.black,
       )
     ),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
