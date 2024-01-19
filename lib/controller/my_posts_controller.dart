import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../functions/functions.dart';
import '../main.dart';
import '../model/medecine_model.dart';
import 'home_controller.dart';

class MyPostsController extends GetxController {
  HomeController homeController = Get.find();
  List posts = currentUserInfos.posts;

  Map<String, MedecineModel> myPosts = {};
  getPosts() async {
    try {
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
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteFromMyPosts(var medecine, MedecineModel me) async {
    await FirebaseFirestore.instance
        .collection("medecines")
        .doc(medecine)
        .delete();
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.uid)
        .update({
      "userPosts": FieldValue.arrayRemove([medecine])
    });
    myPosts.removeWhere((key, value) => value == me);
    homeController.medecines.removeWhere((key, value) => value == me);
    update();
  }

  @override
  void onInit() {
    getPosts();
    super.onInit();
  }
}
