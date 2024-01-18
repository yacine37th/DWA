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
      await FirebaseFirestore.instance
          .collection("medecines")
          .doc(element)
          .get()
          .then((value) {
        myPosts.addAll({
          value.id: MedecineModel(
              id: value.id,
              name: value.data()?["medecineName"],
              description: value.data()?["medecineDescription"],
              image: value.data()?["medecinePic"],
              expiredDate: "",
              category: value.data()?["medecineCategory"],
              postDate: "",
              phone: value.data()?["medecinePhoneNumber"])
        });
      });
    }
    update();
  }

  Future<void> deleteFromMyPosts(var medecine, MedecineModel me) async {
    await FirebaseFirestore.instance
        .collection("medecines")
        .doc(medecine)
        .delete();
    myPosts.removeWhere((key, value) => value == me);
    update();
  }

  @override
  void onInit() {
    getPosts();
    super.onInit();
  }
}
