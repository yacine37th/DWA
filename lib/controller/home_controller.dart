import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../main.dart';

class HomeController extends GetxController {
  

  ////////Signout
  signOutOfAnExistingAccount() async {
    await FirebaseAuth.instance.signOut().then((value) {
      currentUser = null;
      Get.offAllNamed("/SignIn");
    });
  }
}