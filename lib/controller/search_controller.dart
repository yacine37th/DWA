import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwa/model/medecine_model.dart';
import 'package:get/get.dart';

import '../functions/functions.dart';

class SearchControllerr extends GetxController
    with GetSingleTickerProviderStateMixin {
  Map<String, MedecineModel> searchMedecine = {};
  String? inputSearch = "";
  getInputSearch(input) {
    inputSearch = input;
    // update();
  }

  var getMore = true;
  var isFetching = false;
  getSearched(String? inputSearch) async {
    inputSearch = inputSearch!.toLowerCase();
    // isFetching = true;
    // getMore = true;
    await FirebaseFirestore.instance
        .collection("medecines")
        .where('medecineKeyWords', arrayContains: inputSearch)
        .limit(9)
        .get()
        .then((value) {
      DateTime now = DateTime.now();
      for (int index = 0; index < value.docs.length; index++) {
        print(value.docs[index]["medecineName"]);
        print(MainFunctions.dateFormat
                .format(DateTime.parse(
                    value.docs[index]["medecineDateExpir"].toDate().toString()))
                .compareTo(now.toString()) ==
            1);
        if (MainFunctions.dateFormat
                .format(DateTime.parse(
                    value.docs[index]["medecineDateExpir"].toDate().toString()))
                .compareTo(now.toString()) ==
            1) {
          print("////////////////////");
          print(value.docs[index]["medecineName"]);
          searchMedecine.addAll({
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
    // for (var i = 0; i < searchMedecine.length; i++) {
    //   print(searchMedecine[i]);
    // }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if (inputSearch != null && inputSearch!.isNotEmpty) {
      getSearched(inputSearch);
    }
    super.onInit();
  }
}
