import 'package:dwa/controller/medecine_details_controller.dart';
import 'package:get/get.dart';

class MedecineDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MedecineDetailsController());
  }
}
