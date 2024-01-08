import 'package:get/get.dart';

import '../controller/singin_controller.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
  }
}
