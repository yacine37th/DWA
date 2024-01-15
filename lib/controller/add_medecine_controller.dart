import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwa/controller/home_controller.dart';
import 'package:dwa/functions/functions.dart';
import 'package:dwa/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../model/medecine_model.dart';
import '../theme/main_colors.dart';

class AddMedecineController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController dateinput = TextEditingController();
  HomeController homeController = Get.find();
  String? medecineName;
  String? medecineAbout;
  String? phoneNumber;
  File? bookImage;
  UploadTask? uploadTask;
  DateTime? pickedDate2;

  Future pickimage() async {
    try {
      final bookImage = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 85);
      if (bookImage == null) return;
      final imageTemp = File(bookImage.path);

      this.bookImage = imageTemp;

      print("//////////////////image/////////////////");
      print(bookImage.name);
      update();
      // uploadImage();
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future submit() async {
    Get.defaultDialog(
        onWillPop: () {
          return Future.value();
        },
        barrierDismissible: false,
        title: "pleaseWait".tr,
        content: const CircularProgressIndicator(
          color: AppColors.kPrimary2,
        ));
    try {
      var doc = FirebaseFirestore.instance.collection("medecines").doc();
      var userDoc =
          FirebaseFirestore.instance.collection("users").doc(currentUser!.uid);
      userDoc.update({
        "userPosts": FieldValue.arrayUnion([doc.id]),
      });
      final path2 = 'medecines/${doc.id}';
      final file2 = File(bookImage!.path);

      final ref2 = FirebaseStorage.instance.ref().child(path2);
      uploadTask = ref2.putFile(file2);

      final snapshot2 = await uploadTask!.whenComplete(() => {});

      final bookThumnail = await snapshot2.ref.getDownloadURL();
      print(
          "bookThumnail /////////////////////////////////////////////////////////////////////");
      print(bookThumnail);
      doc.set({
        "medecineID": doc.id,
        "medecinePic": bookThumnail,
        "medecineType": "Post",
        "medecineDateExpir": pickedDate2,
        "medecineDateAdded": FieldValue.serverTimestamp(),
        "medecineCategoryID": selectedValue['id'],
        "medecineUserID": currentUserInfos.uID,
        "medecineCategory": selectedValue['name'],
        "medecineKeyWords": keyWordsMaker(medecineName!),
        "medecineName": medecineName,
        "medecinePhoneNumber": phoneNumber,
        "medecineDescription": medecineAbout,
      }).onError((e, _) => print(
          "Error writing document /////////////////////////////////////////////: $e"));

      homeController.medecines.addAll({
        doc.id: MedecineModel(
            id: doc.id,
            name: medecineName,
            description: medecineAbout,
            image: bookThumnail,
            expiredDate: MainFunctions.dateFormat
                .format(DateTime.parse(pickedDate2.toString())),
            category: selectedValue['name'],
            postDate: DateTime.now.toString(),
            phone: phoneNumber)
      });

      // final path = 'test/${bookImage!.path}';
      // final file = File(bookImage!.path);

      // final ref = FirebaseStorage.instance.ref().child(path);
      // uploadTask = ref.putFile(file);

      // final snapshot = await uploadTask!.whenComplete(() => {});

      // final bookThumnail = await snapshot.ref.getDownloadURL();
      // print(
      //     "bookThumnail /////////////////////////////////////////////////////////////////////");
      // print(bookThumnail);
      Get.back();
      Get.offAndToNamed("/");
      MainFunctions.successSnackBar("Your post has been ");
    } on PlatformException catch (e) {
      print(e);
    }
  }

  var selectedValue;

  List categorieList = [];
  Future getCate() async {
    await FirebaseFirestore.instance
        .collection("categories")
        .get()
        .then((value) async {
      for (int index = 0; index < value.docs.length; index++) {
        categorieList.add({
          "name": value.docs[index]["categoryName"],
          "id": value.docs[index].id,
        });
      }
    });
    update();
  }

  List keyWordsMaker(String text) {
    List<String> keyWordsList = [];
    String temp = "";
    for (var i = 0; i < text.length; i++) {
      if (text[i] == " ") {
        temp = "";
      } else {
        temp = temp + text[i];
        keyWordsList.add(temp);
      }
    }
    return keyWordsList;
  }
  // DateTime? medecineDateExpir;
  // TextEditingController? medecineDateExpir2;

  // Future<DateTime?> pickedDate(context) async {
  //   medecineDateExpir = await showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(1950),
  //       //DateTime.now() - not to allow to choose before today.
  //       lastDate: DateTime(2100));
  //   if (medecineDateExpir != null) {
  //     medecineDateExpir2?.text =
  //         DateFormat('yyyy-MM-dd').format(medecineDateExpir!).toString();
  //     update();
  //     print(medecineDateExpir);
  //     print(medecineDateExpir2);
  //     return medecineDateExpir;
  //   } else {
  //     return null;
  //   }
  // }

  // DateTime selectedDate = DateTime.now();

  // Future<void> selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2024, 1),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != selectedDate) {
  //     selectedDate = picked;
  //     update();
  //   }
  // }
  //  DateTime? pickedDate = await showDatePicker(
  //                         context: context,
  //                         initialDate: DateTime.now(),
  //                         firstDate: DateTime(1950),
  //                         //DateTime.now() - not to allow to choose before today.
  //                         lastDate: DateTime(2100))

  Future<void> pickedDate(BuildContext context) async {
    pickedDate2 = await showDatePicker(
        context: context, //context of current state
        initialDate: DateTime.now(),
        firstDate: DateTime(
            2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate2 != null) {
      // print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate2!);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      dateinput.text = formattedDate;
    } else {
      print("Date is not selected");
    }
  }

  List categ = [
    "Antibiotiques et Antibactériens",
    "Antituberculeux et Antilépreux",
    "Antimycosiques",
    "Antiviraux",
    "Cardiologie",
    "Dermatologie",
    "Diététique et Nutrition",
    "Endocrinologie",
    "Gastro-entérologie et hépatologie",
    "Gynécologie",
    "Hématologie",
    "Immunologie Allergologie",
    "Neurologie",
    "Ophtalmologie",
    "Oto-rhino-laryngologie",
    "Parasitologie",
    "Pneumologie",
    "Psychiatrie",
    "Rhumatologie",
    "Urologie",
    "Vaccins",
    "Cancérologie",
  ];

  @override
  void onInit() {
    // categ.forEach((element) {
    //   var doc = FirebaseFirestore.instance.collection("categories").doc();
    //   doc.set({"categoryName": element, "categoryID": doc.id});
    // });
    dateinput.text = ""; //set the initial value of text field
    getCate();
    super.onInit();
  }
}
