import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddMedecineController extends GetxController {
  final formKey = GlobalKey<FormState>();

  String? medecineName;
  File? bookImage;
  UploadTask? uploadTask;

  Future pickimage() async {
    try {
      final bookImage = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 85);
      if (bookImage == null) return;
      final imageTemp = File(bookImage.path);

      this.bookImage = imageTemp;

      print("//////////////////image/////////////////");
      print(bookImage.name);
      uploadImage();
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future uploadImage() async {
    try {
      var doc = FirebaseFirestore.instance.collection("medecines").doc();

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
      }).onError((e, _) => print(
          "Error writing document /////////////////////////////////////////////: $e"));

      // final path = 'test/${bookImage!.path}';
      // final file = File(bookImage!.path);

      // final ref = FirebaseStorage.instance.ref().child(path);
      // uploadTask = ref.putFile(file);

      // final snapshot = await uploadTask!.whenComplete(() => {});

      // final bookThumnail = await snapshot.ref.getDownloadURL();
      // print(
      //     "bookThumnail /////////////////////////////////////////////////////////////////////");
      // print(bookThumnail);
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
    DateTime? pickedDate = await showDatePicker(
        context: context, //context of current state
        initialDate: DateTime.now(),
        firstDate: DateTime(
            2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      dateinput.text = formattedDate;
    } else {
      print("Date is not selected");
    }
  }

  TextEditingController dateinput = TextEditingController();
  @override
  void onInit() {
    dateinput.text = ""; //set the initial value of text field
    getCate();
    super.onInit();
  }
}
