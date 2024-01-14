import 'package:dwa/controller/add_medecine_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../theme/assets.dart';
import '../theme/main_colors.dart';

class AddMedecine extends StatelessWidget {
  const AddMedecine({super.key});

  @override
  Widget build(BuildContext context) {
    AddMedecineController addMedecineController = Get.find();
    //  final double scaledFontSize = MediaQuery.textScalerOf(context).scale(fontSize);
    return Scaffold(
      appBar: AppBar(
        //   bottom: PreferredSize(
        // preferredSize: Size(0, 0),
        // child: Container(
        //   color: AppColors.kPrimary2,
        //   height: 1,
        // )),
        backgroundColor: AppColors.transparentColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              navigator!.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.kPrimary2,
              // size: 18,
            )),
        //        actions: [
        //   Icon(Icons.favorite),
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 16),
        //     child: Icon(Icons.search),
        //   ),
        //   Icon(Icons.more_vert),
        // ],
      ),
      body: SafeArea(
        child: ListView(
          clipBehavior: Clip.antiAlias,
          physics: const BouncingScrollPhysics(),
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: addMedecineController.formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Center(child: Image.asset(AppAssets.kAppLogo)),
                    // const SizedBox(height: 10),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      onSaved: (name) {
                        addMedecineController.medecineName = name;
                      },
                      onChanged: (name) {
                        addMedecineController.medecineName = name;

                        // signInController.userEmailAddress =
                        //     userEmailAddress.trim();
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "enterMedicineName".tr;
                        } else if (val.length < 2) {
                          return "medicineName>2".tr;
                        }
                        // if (!RegExp(
                        //         r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                        //     .hasMatch(val)) {
                        //   return "enterValidEmail".tr;
                        // }
                        return null;
                      },
                      // initialValue: signInController.userEmailAddress,
                      decoration: InputDecoration(
                        hintText: 'medicineName'.tr,
                        errorMaxLines: 2,
                        prefixIcon: const Icon(Icons.medical_information,
                            color: AppColors.kLine),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.kLine),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.kPrimary2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.kLine),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.KError),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey),
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     GetBuilder<AddMedecineController>(
                    //       builder: (context) => Text(
                    //           "${addMedecineController.selectedDate}"
                    //               .split(' ')[0]),
                    //     ),
                    //     const SizedBox(
                    //       height: 20.0,
                    //     ),
                    //     ElevatedButton(
                    //       onPressed: () =>
                    //           addMedecineController.selectDate(context),
                    //       child: const Text('Select date'),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    GetBuilder<AddMedecineController>(
                      builder: (contx) => TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "enterMedicineName".tr;
                          } else if (val.length < 2) {
                            return "medicineName>2".tr;
                          }
                          // if (!RegExp(
                          //         r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                          //     .hasMatch(val)) {
                          //   return "enterValidEmail".tr;
                          // }
                          return null;
                        },
                        controller: addMedecineController
                            .dateinput, //editing controller of this TextField
                        decoration: InputDecoration(
                          hintText: "YYYY-XX-XX",
                          errorMaxLines: 2,
                          prefixIcon: const Icon(Icons.calendar_month,
                              color: AppColors.kLine),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.kLine),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.kPrimary2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.kLine),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.KError),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey),
                        ),
                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () async {
                          addMedecineController.pickedDate(context);
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      onSaved: (phoneNumber) {
                        addMedecineController.phoneNumber = phoneNumber;
                      },
                      onChanged: (phoneNumber) {
                        addMedecineController.phoneNumber = phoneNumber;
                        // signInController.userEmailAddress =
                        //     userEmailAddress.trim();
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "enterMedicineName".tr;
                        } else if (val.length < 2) {
                          return "medicineName>2".tr;
                        }
                        // if (!RegExp(
                        //         r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                        //     .hasMatch(val)) {
                        //   return "enterValidEmail".tr;
                        // }
                        return null;
                      },
                      // initialValue: signInController.userEmailAddress,
                      maxLength: 10,
                      decoration: InputDecoration(
                        hintText: 'Numero de telephone'.tr,
                        errorMaxLines: 2,
                        prefixIcon: const Icon(Icons.phone_outlined,
                            color: AppColors.kLine),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.kLine),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.kPrimary2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.kLine),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.KError),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey),
                      ),
                    ),

                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        // Get.toNamed("/SignUp");
                        addMedecineController.pickimage();
                      },
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                            AppColors.kPrimary2,
                          ),
                          textStyle:
                              MaterialStateProperty.resolveWith((states) {
                            Color textColor =
                                states.contains(MaterialState.disabled)
                                    ? AppColors.kPrimary2
                                    : AppColors.kLine;
                            return TextStyle(fontSize: 18, color: textColor);
                          }),
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => AppColors.kPrimary2.withOpacity(0.2)),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  side: const BorderSide(
                                    color: AppColors.kPrimary2,
                                  )))),
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Container(
                          height: 35,
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                          child: const Text(
                            "Pick image",
                            style: TextStyle(
                                color: AppColors.kPrimary2,
                                fontSize: 19,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    GetBuilder<AddMedecineController>(
                      builder: (contx) => DropdownButtonFormField(
                          value: addMedecineController.selectedValue,
                          hint: const Text('choose the Category of the book',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey)),
                          focusColor: AppColors.kPrimary2,
                          decoration: InputDecoration(
                            hintText: 'medicineName'.tr,
                            errorMaxLines: 2,
                            prefixIcon: const Icon(Icons.category,
                                color: AppColors.kLine),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.kLine),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.kPrimary2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.kLine),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.KError),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey),
                          ),
                          isExpanded: true,
                          onChanged: (value) {
                            addMedecineController.selectedValue = value;
                          },
                          onSaved: (value) {
                            addMedecineController.selectedValue = value;
                          },
                          validator: (value) => value == null
                              ? 'Select the Category of the book'
                              : null,
                          items: addMedecineController.categorieList
                              .map((category) {
                            return DropdownMenuItem(
                              child: Text(category["name"]),
                              value: category,
                            );
                          }).toList()),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      minLines: 3,
                      maxLines: 8,
                      keyboardType: TextInputType.multiline,
                      // controller:addMedecineController.medecineAbout,
                      onSaved: (about) {
                        // signInController.userEmailAddress = userEmailAddress;
                        addMedecineController.medecineAbout = about;
                      },
                      onChanged: (about) {
                        addMedecineController.medecineAbout = about;
                        // signInController.userEmailAddress =
                        //     userEmailAddress.trim();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the Descrption of the Book';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                        hintText: "Enter the Descrption of the Book",
                        // labelText: 'Enter text',
                      ),
                    ),
                    const SizedBox(height: 20),

                    TextButton(
                      onPressed: () {
                        if (addMedecineController.formKey.currentState!
                            .validate()) {
                          addMedecineController.formKey.currentState!.save();
                          // signInController.signInAUser();
                          addMedecineController.submit();
                        }
                      },
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                            AppColors.kPrimary2,
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            AppColors.kPrimary2,
                          ),
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) =>
                                  AppColors.kPrimary2Onpress.withOpacity(0.2)),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  side: const BorderSide(
                                    color: AppColors.kPrimary2,
                                  )))),
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        color: Colors.transparent,
                        child: Container(
                          height: 35,
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            // color: AppColors.kPrimary,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Publier".tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
