import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwa/model/medecine_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../model/user_model.dart';

class HomeController extends GetxController {
  late ScrollController hideButtonController;
//  Map<String , MedecineModel> medecines = {

//  };
  Map<String, MedecineModel> medecines = {};
  // final List<MedecineModel> medecines = [
  //   MedecineModel(
  //     name: 'Kardegic',
  //     description: 'Description 1',
  //     id: 'Product 1',
  //     image:
  //         "https://www.pharmacie-du-centre-albert.fr/resize/600x600/media/finish/img/normal/52/3400930126295-acetylleucine-biogaran-500-mg-30-comprimes-gamme-pda.jpg",
  //     expiredDate: null,
  //     category: 'Antibiotiques et Antibactériens',
  //   ),
  //   MedecineModel(
  //     name: 'Kardegic',
  //     description: 'Description 1',
  //     id: 'Product 1',
  //     image:
  //         "https://images.unsplash.com/photo-1589188056053-28910dc61d38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2264&q=80",
  //     expiredDate: null,
  //     category: 'Antibiotiques et Antibactériens',
  //   ),
  //   MedecineModel(
  //     name: 'Acétylleucine',
  //     description: 'Description 1',
  //     id: 'Product 1',
  //     image:
  //         "https://images.unsplash.com/photo-1589188056053-28910dc61d38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2264&q=80",
  //     expiredDate: null,
  //     category: 'Antibiotiques et Antibactériens',
  //   ),

  //   // Add more products as needed
  // ];

  Future getMedecines() async {
    await FirebaseFirestore.instance
        .collection("medecines")
        .get()
        .then((value) async {
      for (int index = 0; index < value.docs.length; index++) {
        // if (value.docs[index]["medecineDateExpir"] < DateTime.now()) {
        medecines.addAll({
          value.docs[index].id: MedecineModel(
              id: value.docs[index].id,
              name: value.docs[index]["medecineName"],
              description: value.docs[index]["medecineCategory"],
              image: value.docs[index]["medecinePic"],
              expiredDate: value.docs[index]["medecineDateExpir"],
              category: value.docs[index]["medecineCategory"],
              postDate: value.docs[index]["medecineDateAdded"],
              phone: value.docs[index]["medecinePhoneNumber"])
        });
        // }
      }
    });
    update();
  }
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
    getMedecines();
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
      currentUserInfos = UserModel(uID: "", email: "", name: "");
      update();
      // Get.offAllNamed("/SignIn");
    });
  }
}
