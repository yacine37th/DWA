import 'package:get/get.dart';

import '../controller/signup_constroller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}
