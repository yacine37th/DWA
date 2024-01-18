import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwa/controller/home_screen_controller.dart';
import 'package:dwa/controller/my_posts_controller.dart';
import 'package:dwa/model/medecine_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../functions/functions.dart';
import '../main.dart';
import '../model/user_model.dart';

class HomeController extends GetxController {
  late ScrollController hideButtonController;
  ScrollController? scrollController;
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
    isFetching = true;

    await FirebaseFirestore.instance
        .collection("medecines")
        .orderBy("medecineDateAdded", descending: true)
        .limit(4)
        .get()
        .then((value) async {
      if (value.docs.isEmpty) {
        getMore = false;
        print("*******dddddd***********");
      }
      DateTime now = DateTime.now();
      for (int index = 0; index < value.docs.length; index++) {
        ////////get only the medecine which didn't expired his date
        // print("inside");
        if (MainFunctions.dateFormat
                .format(DateTime.parse(
                    value.docs[index]["medecineDateExpir"].toDate().toString()))
                .compareTo(now.toString()) ==
            1) {
          // print("inside2");
          medecines.addAll({
            value.docs[index].id: MedecineModel(
                id: value.docs[index].id,
                name: value.docs[index]["medecineName"],
                description: value.docs[index]["medecineDescription"],
                image: value.docs[index]["medecinePic"],
                expiredDate: MainFunctions.dateFormat.format(DateTime.parse(
                    value.docs[index]["medecineDateExpir"]
                        .toDate()
                        .toString())),
                category: value.docs[index]["medecineCategory"],
                postDate: MainFunctions.dateFormat.format(DateTime.parse(value
                    .docs[index]["medecineDateAdded"]
                    .toDate()
                    .toString())),
                phone: value.docs[index]["medecinePhoneNumber"])
          });
        }
      }
    });
    print(
        "fetch////////////////////////////////////////////////////////////////////////");
    print("fetch");
    isFetching = false;

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
  var getMore = true;
  var isFetching = false;
  void _scrollListener() async {
    print("******************");
    if (getMore) {
      if (scrollController?.position.pixels ==
              scrollController?.position.maxScrollExtent &&
          isFetching == false) {
        isFetching = true;
        await getMedecines();
        isFetching = false;
      }
    }
  }

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(_scrollListener);

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
      currentUserInfos = UserModel(uID: "", email: "", name: "", posts: []);
      HomeScreenController.myPostsController.myPosts = {};
      update();
      // Get.offAllNamed("/SignIn");
    });
  }
}
