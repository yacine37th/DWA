import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../functions/functions.dart';
import '../main.dart';
import '../theme/main_colors.dart';

class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  bool showPassword = true;
  final priviousPage = Get.arguments;

  String? userEmailAddress;
  String? userPassword;

  invertShowPassword() {
    showPassword = !showPassword;
    update();
  }

  signInAUser() async {
    Get.defaultDialog(
        onWillPop: () {
          return Future.value();
        },
        barrierDismissible: false,
        title: "pleaseWait".tr,
        content: const CircularProgressIndicator(
          color: AppColors.kPrimary2,
        ));
    try {
      print(userEmailAddress);
      print(userPassword);
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmailAddress!, password: userPassword!);
      print("credential");
      print(credential);
      currentUser = FirebaseAuth.instance.currentUser;

      // var queries = await FirebaseFirestore.instance
      //     .collection("Users")
      //     .doc(currentUser!.uid)
      //     .collection("MyTrips")
      //     .get();
      // queries.docs.forEach((element) {
      //   myTripsUIDs.add(element.id);
      // });

      // myTripsUIDs.forEach((element) async {
      //   var temp = await FirebaseFirestore.instance
      //       .collection("Trips")
      //       .doc(element)
      //       .get();
      //   TripModel tripTemp = TripModel(
      //       tripUID: temp["tripUID"],
      //       driverUID: temp["driverUID"],
      //       driverUserName: temp["driverUserName"],
      //       departure: temp["departure"],
      //       destination: temp["destination"],
      //       tripDate: temp["tripDate"],
      //       price: temp["price"],
      //       condition: temp["condition"],
      //       allSeats: temp["allSeats"],
      //       seatsLeft: temp["seatsLeft"]);
      //   tempMyTrips.add(tripTemp);
      // });
      // List<TripModel> tempMyTransmitterTrips = [];
      // List<String> myTransmitterTripsUIDs = [];

      // var queries1 = await FirebaseFirestore.instance
      //     .collection("Users")
      //     .doc(currentUser!.uid)
      //     .collection("MyTrips")
      //     .get();
      // queries1.docs.forEach((element) {
      //   myTransmitterTripsUIDs.add(element.id);
      // });

      // myTransmitterTripsUIDs.forEach((element) async {
      //   var temp = await FirebaseFirestore.instance
      //       .collection("Trips")
      //       .doc(element)
      //       .get();
      //   TripModel tripTemp = TripModel(
      //       tripUID: temp["tripUID"],
      //       driverUID: temp["driverUID"],
      //       driverUserName: temp["driverUserName"],
      //       departure: temp["departure"],
      //       destination: temp["destination"],
      //       tripDate: temp["tripDate"],
      //       price: temp["price"],
      //       condition: temp["condition"],
      //       allSeats: temp["allSeats"],
      //       seatsLeft: temp["seatsLeft"]);
      //   tempMyTransmitterTrips.add(tripTemp);
      // });

      await MainFunctions.getcurrentUserInfos();
      Get.back();
      if (credential.user!.emailVerified) {
        if (priviousPage == "home") {
          Get.offAndToNamed("/AddMedecine");
        } else {
          Get.offAndToNamed("/");
        }
      } else {
        Get.toNamed("/EmailVerification");
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      print(e);
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
          title: "user-not-found".tr,
          content: const Icon(
            Icons.report_problem,
            color: Colors.red,
          ),
          onConfirm: () {
            Get.back();
          },
        );
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
          title: "wrong-password".tr,
          content: const Icon(
            Icons.report_problem,
            color: Colors.red,
          ),
          onConfirm: () {
            Get.back();
          },
        );
      } else if (e.code == "invalid-credential") {
        Get.defaultDialog(
          title: "Invalid password or email please try again",
          content: const Icon(
            Icons.report_problem,
            color: Colors.red,
          ),
          onConfirm: () {
            Get.back();
          },
        );
      } else {
        Get.defaultDialog(
          title: "Somthing went wrong , please try later",
          content: const Icon(
            Icons.report_problem,
            color: Colors.red,
          ),
          onConfirm: () {
            Get.back();
          },
        );
      }
      // auth/invalid-credential
      // else {
      //   print("///////");
      //   Get.defaultDialog(
      //     title: "Quelque chose ne va pas",
      //     content: const Icon(
      //       Icons.report_problem,
      //       color: Colors.red,
      //     ),
      //     onConfirm: () {
      //       Get.back();
      //     },
      //   );
      // }
    } catch (e) {
      Get.back();
      print(e);
      Get.defaultDialog(
        title: "Quelque chose ne va pas",
        content: const Icon(
          Icons.report_problem,
          color: Colors.red,
        ),
        onConfirm: () {
          Get.back();
        },
      );
    }
  }

  @override
  void onInit() {
    print(priviousPage);
    super.onInit();
  }

  // String localeValue = MainFunctions.sharredPrefs!.getString("codeLang") ??
  //     Get.deviceLocale!.languageCode;

  //      setLanguage() {
  //   Get.defaultDialog(
  //       title: "language".tr,
  //       content: Column(
  //         children: [
  //           TextButton(
  //               onPressed: () {
  //                 localeValue = "fr";
  //                 Get.updateLocale(const Locale("fr"));
  //                 MainFunctions.sharredPrefs!
  //                     .setString("codeLang", localeValue);
  //                 Get.back();
  //               },
  //               child: Text("francais".tr)),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           TextButton(
  //               onPressed: () {
  //                 localeValue = "en";
  //                 Get.updateLocale(const Locale("en"));
  //                 MainFunctions.sharredPrefs!
  //                     .setString("codeLang", localeValue);
  //                 Get.back();
  //               },
  //               child: Text("english".tr)),
  //         ],
  //       ));

  //   update();
  // }
}
