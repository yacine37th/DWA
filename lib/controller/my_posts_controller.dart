import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../functions/functions.dart';
import '../main.dart';
import '../model/medecine_model.dart';

class MyPostsController extends GetxController {
  List posts = currentUserInfos.posts;

  Map<String, MedecineModel> myPosts = {};
  getPosts() async {
    for (var element in posts) {
      var doc = await FirebaseFirestore.instance
          .collection("medecines")
          .doc(element)
          .get();
          print(doc);
      // myPosts.addAll({
      //   doc.id: MedecineModel(
      //       id: doc.id,
      //       name: doc["medecineName"],
      //       description: doc["medecineDescription"],
      //       image: doc["medecinePic"],
      //       expiredDate: MainFunctions.dateFormat.format(
      //           DateTime.parse(doc["medecineDateExpir"].toDate().toString())),
      //       category: doc["medecineCategory"],
      //       postDate: MainFunctions.dateFormat.format(
      //           DateTime.parse(doc["medecineDateAdded"].toDate().toString())),
      //       phone: doc["medecinePhoneNumber"])
   
      // });
    }
    update();
  }

  @override
  void onInit() {
    getPosts();
    super.onInit();
  }
}
