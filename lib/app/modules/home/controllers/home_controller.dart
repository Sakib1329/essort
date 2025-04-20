import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var isOn = false.obs;
  var selectedOption = 0.obs;

  void setOption(int? value) {
    if (value != null) {
      selectedOption.value = value;
    }
  }
//calender portion
  RxList<DateTime?> dates = <DateTime?>[DateTime.now()].obs;

  void updateDates(List<DateTime?> newDates) {
    dates.value = newDates;
  }
}
