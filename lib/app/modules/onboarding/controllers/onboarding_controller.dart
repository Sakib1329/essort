import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  var currentPage = 0.obs;

  final onboardingData = [
    {
      'image': 'assets/images/pana.png',
      'title': ' Unlock the Power\nOf  Future AI',
      'subtitle': 'Chat with the smartest AI Future\nExperience power of AI with us',
    },
    {
      'image': 'assets/images/rafiki.png',
      'title': '  Chat With Your\nFavourite Ai',
      'subtitle': 'Chat with the smartest AI Future\nExperience power of AI with us',
    },
    {
      'image': 'assets/images/amico.png',
      'title': 'Boost Your Mind\nPower with Ai',
      'subtitle': 'Chat with the smartest AI Future\nExperience power of AI with us',
    },
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void next() {
    if (currentPage.value < onboardingData.length - 1) {
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      _finishOnboarding();
    }
  }
  void back() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void skip() {
    _finishOnboarding();
  }

  void _finishOnboarding() {

    Get.toNamed(Routes.AUTH);
  }
}
