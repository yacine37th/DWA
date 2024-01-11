import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class HomeController extends GetxController {
  
 late ScrollController hideButtonController;

  // late final AnimationController controller = AnimationController(
  //   duration: const Duration(milliseconds: 10),
  //   vsync:  TickerProvider(),
  // )
  //   ..addListener(() {
  //    update();
  //   })
  //   ..forward();//first time load
  // late final Animation<Offset> offsetAnimation = Tween<Offset>(
  //   end: Offset.zero,
  //   begin: const Offset(0, 5.0),
  // ).animate(CurvedAnimation(
  //   parent: controller,
  //   curve: Curves.linear,
  // ));

  @override
  void onInit() {
    
    super.onInit();
  }



  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }





    ////////Signout
  signOutOfAnExistingAccount() async {
    await FirebaseAuth.instance.signOut().then((value) {
      currentUser = null;
      Get.offAllNamed("/SignIn");
    });
  }
}