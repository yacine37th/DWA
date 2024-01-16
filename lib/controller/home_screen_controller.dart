import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../functions/functions.dart';
import '../theme/main_colors.dart';
import '../view/home.dart';
import '../view/profil.dart';
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextButton(
                onPressed: () {
                  // Get.toNamed("/SignUp");
                  localeValue = "fr";
                  Get.updateLocale(const Locale("fr"));
                  MainFunctions.sharredPrefs!
                      .setString("codeLang", localeValue);
                  Get.back();
                },
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      AppColors.kPrimary2,
                    ),
                    // backgroundColor: MaterialStateProperty.all(
                    //   AppColors.kPrimary2,
                    // ),
                    // textStyle: MaterialStatePropertyAll(),
                    textStyle: MaterialStateProperty.resolveWith((states) {
                      Color textColor = states.contains(MaterialState.disabled)
                          ? AppColors.kPrimary2
                          : AppColors.kLine;
                      return TextStyle(fontSize: 18, color: textColor);
                    }),
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => AppColors.kPrimary2.withOpacity(0.2)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: const BorderSide(
                          color: AppColors.kPrimary2,
                        )))),
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Container(
                    height: 35,
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      // border: Border.all(color: AppColors.kPrimary),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Text(
                      "francais".tr,
                      style: const TextStyle(
                          color: AppColors.kPrimary2,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),

            // TextButton(
            //     onPressed: () {
            //       localeValue = "fr";
            //       Get.updateLocale(const Locale("fr"));
            //       MainFunctions.sharredPrefs!
            //           .setString("codeLang", localeValue);
            //       Get.back();
            //     },
            //     child: Text("francais".tr)),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextButton(
                onPressed: () {
                  // Get.toNamed("/SignUp");
                  localeValue = "en";
                  Get.updateLocale(const Locale("en"));
                  MainFunctions.sharredPrefs!
                      .setString("codeLang", localeValue);
                  Get.back();
                },
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      AppColors.kPrimary2,
                    ),
                    // backgroundColor: MaterialStateProperty.all(
                    //   AppColors.kPrimary2,
                    // ),
                    // textStyle: MaterialStatePropertyAll(),
                    textStyle: MaterialStateProperty.resolveWith((states) {
                      Color textColor = states.contains(MaterialState.disabled)
                          ? AppColors.kPrimary2
                          : AppColors.kLine;
                      return TextStyle(fontSize: 18, color: textColor);
                    }),
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => AppColors.kPrimary2.withOpacity(0.2)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: const BorderSide(
                          color: AppColors.kPrimary2,
                        )))),
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Container(
                    height: 35,
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      // border: Border.all(color: AppColors.kPrimary),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Text(
                      "english".tr,
                      style: const TextStyle(
                          color: AppColors.kPrimary2,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextButton(
                onPressed: () {
                  // Get.toNamed("/SignUp");
                  localeValue = "ar";
                  Get.updateLocale(const Locale("ar"));
                  MainFunctions.sharredPrefs!
                      .setString("codeLang", localeValue);
                  Get.back();
                },
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      AppColors.kPrimary2,
                    ),
                    // backgroundColor: MaterialStateProperty.all(
                    //   AppColors.kPrimary2,
                    // ),
                    // textStyle: MaterialStatePropertyAll(),
                    textStyle: MaterialStateProperty.resolveWith((states) {
                      Color textColor = states.contains(MaterialState.disabled)
                          ? AppColors.kPrimary2
                          : AppColors.kLine;
                      return TextStyle(fontSize: 18, color: textColor);
                    }),
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => AppColors.kPrimary2.withOpacity(0.2)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: const BorderSide(
                          color: AppColors.kPrimary2,
                        )))),
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Container(
                    height: 35,
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      // border: Border.all(color: AppColors.kPrimary),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Text(
                      "arab".tr,
                      style: const TextStyle(
                          color: AppColors.kPrimary2,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),

            // TextButton(
            //     onPressed: () {
            //       localeValue = "en";
            //       Get.updateLocale(const Locale("en"));
            //       MainFunctions.sharredPrefs!
            //           .setString("codeLang", localeValue);
            //       Get.back();
            //     },
            //     child: Text("english".tr)),
          ],
        ));

    update();
  }

  List<Widget> bottomNavigationBarScreensList = [
    Home(),
    Home(),
    Profil(),

    // Home(),
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
