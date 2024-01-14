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
  final List<MedecineModel> medecines = [
    MedecineModel(
      name: 'Kardegic',
      description: 'Description 1',
      id: 'Product 1',
      image:
          "https://images.unsplash.com/photo-1589188056053-28910dc61d38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2264&q=80',",
      expiredDate: null,
      category: 'Antibiotiques et Antibactériens',
    ),
    MedecineModel(
      name: 'Kardegic',
      description: 'Description 1',
      id: 'Product 1',
      image:
          "https://images.unsplash.com/photo-1589188056053-28910dc61d38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2264&q=80",
      expiredDate: null,
      category: 'Antibiotiques et Antibactériens',
    ),
    MedecineModel(
      name: 'Acétylleucine',
      description: 'Description 1',
      id: 'Product 1',
      image:
          "https://images.unsplash.com/photo-1589188056053-28910dc61d38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2264&q=80",
      expiredDate: null,
      category: 'Antibiotiques et Antibactériens',
    ),

    // Add more products as needed
  ];
  // Map<String , MedecineModel> medecines =  [
  //   {
  //     'name': 'Kardegic',
  //     'image':
  //         "data:image/jpeg;base64,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",
  //         'category' : "Antibiotiques et Antibactériens",
  //     'description': 'Medecine for .edededededed'
  //   },
  //   {
  //     'title': 'Acétylleucine',
  //     'image':
  //         'https://www.pharmacie-du-centre-albert.fr/resize/600x600/media/finish/img/normal/52/3400930126295-acetylleucine-biogaran-500-mg-30-comprimes-gamme-pda.jpg',
  //         'category' : "Antibiotiques et Antibactériens",
  //     'description': 'Limited collection'
  //   },
  //   {
  //     'title': 'Adidas Originals \nby Alexander Wang',
  //     'image':
  //         'https://images.unsplash.com/photo-1589188056053-28910dc61d38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2264&q=80',
  //     'description': 'Limited collection'
  //   }
  // ];

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
      currentUserInfos = UserModel(uID: "", email: "", name: "");
      update();
      // Get.offAllNamed("/SignIn");
    });
  }
}
