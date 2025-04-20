// personal_info_controller.dart
import 'package:get/get.dart';

class PersonalInfoController extends GetxController {
  RxBool isNameEditable = false.obs;
  RxBool isPasswordEditable = false.obs;

  void toggleNameEdit() {
    print("Toggling name edit");
    isNameEditable.toggle();
  }

  void togglePasswordEdit() => isPasswordEditable.toggle();
}
