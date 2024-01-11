import 'package:dwa/controller/add_medecine_controller.dart';
import 'package:get/get.dart';

class AddMedecineBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AddMedecineController());
  }
}
