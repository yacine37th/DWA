import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../functions/functions.dart';
import '../main.dart';
import '../model/medecine_model.dart';

class MyPostsController extends GetxController {
  List posts = currentUserInfos.posts;

  Map<String, MedecineModel> myPosts = {};
  getPosts() async {
    myPosts.clear();
    for (var element in posts) {
      await FirebaseFirestore.instance
          .collection("medecines")
          .doc(element)
          .get()
          .then((value) {
        print(value.data()?["medecineName"]);
        myPosts.addAll({
          value.id: MedecineModel(
              id: value.id,
              name: value.data()?["medecineName"],
              description: value.data()?["medecineDescription"],
              image: value.data()?["medecinePic"],
              expiredDate:""
              //  MainFunctions.dateFormat.format(DateTime.parse(
              //     value.data()["medecineDateExpir"].toDate().toString()))
                  ,
              category: value.data()?["medecineCategory"],
              postDate: ""
              // MainFunctions.dateFormat.format(DateTime.parse(
              //     value.data()["medecineDateAdded"].toDate().toString()))
                  ,
              phone: value.data()?["medecinePhoneNumber"])
        });
      });
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
