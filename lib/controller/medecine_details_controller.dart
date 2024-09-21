import 'package:dwa/model/medecine_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class MedecineDetailsController extends GetxController {
  late MedecineModel medecine = Get.arguments["0"];
  Future<void> launchPhoneDialer(String contactNumber) async {
    final Uri phoneUri = Uri(scheme: "tel", path: contactNumber);
    try {
      if (await UrlLauncher.canLaunchUrl(phoneUri)) {
        await UrlLauncher.launchUrl(phoneUri);
      }
    } catch (error) {
      throw ("//////////////Cannot dial");
    }
  }
}
