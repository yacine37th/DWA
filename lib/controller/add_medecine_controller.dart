import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddMedecineController extends GetxController {
  final formKey = GlobalKey<FormState>();

  String? medecineName;
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
    DateTime? pickedDate =  await showDatePicker(
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
    super.onInit();
  }
}
