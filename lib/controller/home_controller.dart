import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwa/controller/home_screen_controller.dart';
import 'package:dwa/controller/my_posts_controller.dart';
import 'package:dwa/model/medecine_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../functions/functions.dart';
import '../main.dart';
import '../model/user_model.dart';

class HomeController extends GetxController {
  final Future<SharedPreferences> sahredPrefs = SharedPreferences.getInstance();

  late ScrollController hideButtonController;
  ScrollController? scrollController;

  Map<String, MedecineModel> medecines = {};

  bool getMore = true;
  bool isFetching = false;
  DocumentSnapshot? lastDocument;

  Future<void> getMedecines({bool isInitial = true}) async {
    if (isInitial) {
      isFetching = true;
      medecines.clear();
      lastDocument = null;
    }

    try {
      Query query = FirebaseFirestore.instance
          .collection("medecines")
          .orderBy("medecineDateAdded", descending: true)
          .limit(10);

      if (!isInitial && lastDocument != null) {
        query = query.startAfterDocument(lastDocument!);
      }

      QuerySnapshot querySnapshot = await query.get();

      if (querySnapshot.docs.isEmpty) {
        getMore = false;
        print("No more documents to fetch");
        return;
      }

      DateTime now = DateTime.now();
      for (var doc in querySnapshot.docs) {
        DateTime expiryDate =
            DateTime.parse(doc["medecineDateExpir"].toDate().toString());
        if (expiryDate.isAfter(now)) {
          medecines[doc.id] = MedecineModel(
            id: doc.id,
            name: doc["medecineName"],
            description: doc["medecineDescription"],
            image: doc["medecinePic"],
            expiredDate: MainFunctions.dateFormat.format(expiryDate),
            category: doc["medecineCategory"],
            postDate: MainFunctions.dateFormat.format(
                DateTime.parse(doc["medecineDateAdded"].toDate().toString())),
            phone: doc["medecinePhoneNumber"],
          );
        }
      }

      lastDocument = querySnapshot.docs.last;
    } catch (e) {
      print("Error fetching medicines: $e");
    } finally {
      isFetching = false;
      update();
    }
  }

  void _scrollListener() {
    if (!getMore || isFetching) return;

    if (scrollController!.position.pixels >=
        scrollController!.position.maxScrollExtent * 0.8) {
      getMedecines(isInitial: false);
    }
  }

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(_scrollListener);
    getMedecines();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController?.removeListener(_scrollListener);
    scrollController?.dispose();
    super.onClose();
  }

  Future<void> signOutOfAnExistingAccount() async {
    await FirebaseAuth.instance.signOut();
    currentUser = null;
    currentUserInfos =
        UserModel(uID: "", email: "", name: "", posts: [], phone: '', type: '');
    HomeScreenController.myPostsController.myPosts = {};
    update();
  }
}
