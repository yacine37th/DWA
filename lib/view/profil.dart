import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../controller/home_screen_controller.dart';
import '../functions/functions.dart';
import '../main.dart';
import '../theme/colors.dart';
import '../theme/main_colors.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.find();
    HomeController homeController = Get.find();
    return Scaffold(
      // backgroundColor: AppColors.kBackground,
      body: Stack(
        children: [
          // const BackgroundImage(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  decoration: BoxDecoration(
                    color: lightBlueColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColors.kPrimary2),
                    //  Border.all(color: Colors.red)
                  ),
                  child: GetBuilder<HomeController>(
                    builder: (contx) => currentUser != null
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 75,
                                      height: 75,
                                      child: CircleAvatar(
                                        backgroundColor:
                                            MainFunctions.generatePresizedColor(
                                                currentUserInfos.name!.length),
                                        child: Text(
                                          currentUserInfos.name![0]
                                              .toUpperCase(),
                                          style: const TextStyle(
                                              fontSize: 35, color: blackColor),
                                        ),
                                      )
                                      // : CircleAvatar(
                                      //     backgroundImage: NetworkImage(
                                      //         currentUserInfos.currentUserImageURL!),
                                      //   ),
                                      ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(currentUserInfos.name!,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: blackColor,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "${currentUser?.email}",
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                width: double.infinity,
                                child: TextButton.icon(
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                blackColor),
                                        backgroundColor:
                                            MaterialStateProperty.all(Colors
                                                .purple
                                                .withOpacity(0.5))),
                                    icon: const Icon(
                                        Icons.favorite_border_outlined),
                                    onPressed: () {
                                      // Get.toNamed("/MyTrips");
                                      homeScreenController
                                          .switchBetweenScreens(1);
                                    },
                                    label: const Text("My favorites",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ))),
                              ),
                              // const SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                child: TextButton.icon(
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                blackColor),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.cyan.withOpacity(0.5))),
                                    icon: const Icon(Icons.pin_drop_outlined),
                                    onPressed: () async {
                                      // Get.toNamed("/MyTransmitterTrips");
                                      // if (currentUserInfos.latitude != 0 &&
                                      //     currentUserInfos.longitude != 0) {

                                      // }
                                    },
                                    label: const Text("My Position",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ))),
                              ),
                              // const SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                child: TextButton.icon(
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                blackColor),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red.withOpacity(0.5))),
                                    icon: const Icon(Icons.logout),
                                    onPressed: () {
                                      homeController
                                          .signOutOfAnExistingAccount();
                                      // await FirebaseAuth.instance.signOut().then((value) {
                                      //   currentUser = null;

                                      //   Get.offAllNamed("/SignIn");
                                      // });
                                    },
                                    label: const Text("Sign Out",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ))),
                              ),
                              const SizedBox(height: 20),
                            ],
                          )
                        :
                        // Center(
                        //     child:
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 50),
                            child: TextButton(
                              onPressed: () {
                                // if (signInController.formKey.currentState!
                                //     .validate()) {
                                //   signInController.formKey.currentState!.save();
                                //   signInController.signInAUser();
                                // }
                                Get.toNamed("/SignIn" , arguments: "profil");
                              },
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all(
                                    AppColors.kPrimary2,
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                    AppColors.kPrimary2,
                                  ),
                                  overlayColor: MaterialStateColor.resolveWith(
                                      (states) => AppColors.kPrimary2Onpress
                                          .withOpacity(0.2)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          side: BorderSide(
                                            color: AppColors.kPrimary2,
                                          )))),
                              child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                color: Colors.transparent,
                                child: Container(
                                  height: 35,
                                  alignment: Alignment.center,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    // color: AppColors.kPrimary,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    "login".tr,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  )),
              // ),
            ),
          )
        ],
      ),
    );
  }
}
