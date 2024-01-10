import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../functions/functions.dart';
import '../view/home.dart';
import 'home_controller.dart';

class HomeScreenController extends GetxController {
  int _currentBottomBarIndex = 0;

  int currentBottomBarIndex() {
    return _currentBottomBarIndex;
  }

  switchBetweenScreens(index) async {
    _currentBottomBarIndex = index;
    if (index == 0) {
      _currentBottomBarIndex = index;
    }
    if (index == 1) {
      _currentBottomBarIndex = index;

      // Apis.getFirebaseMessagingToken();
    }
    if (index == 2) {
      _currentBottomBarIndex = index;
    }
    update();
  }

  String localeValue = MainFunctions.sharredPrefs!.getString("codeLang") ??
      Get.deviceLocale!.languageCode;
  setLanguage() {
    Get.defaultDialog(
        title: "language".tr,
        content: Column(
          children: [
            TextButton(
                onPressed: () {
                  localeValue = "fr";
                  Get.updateLocale(const Locale("fr"));
                  MainFunctions.sharredPrefs!
                      .setString("codeLang", localeValue);
                  Get.back();
                },
                child: Text("francais".tr)),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  localeValue = "en";
                  Get.updateLocale(const Locale("en"));
                  MainFunctions.sharredPrefs!
                      .setString("codeLang", localeValue);
                  Get.back();
                },
                child: Text("english".tr)),
          ],
        ));

    update();
  }

  List<Widget> bottomNavigationBarScreensList = [
    Home(),
    Home(),
    Home(),
    Home(),
    // FavorisPage(),
    // CartePage(),
    // Profil(),

    // Tasnifat(),
    // MyAccount(),
    // MaxSubscription()
  ];
  @override
  onInit() async {
    update();
    Get.put(HomeController());
    // Get.put(FavorisPageController());
    // Get.put(CarteController());

    // Get.put(MaktabatiController()); //account controller
    // Get.put(MaxSubscriptionController());

    super.onInit();
  }
}
