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
                    // const SizedBox(height: 30),
                    //  Text('login'.tr,
                    //     style: TextStyle(
                    //       fontSize: 30,
                    //       fontWeight: FontWeight.bold,
                    //     )),
                    const SizedBox(height: 30),

                    // const SizedBox(
                    //   height: 30,
                    //   child: Text(
                    //     "Or with Email",
                    //     style: TextStyle(fontSize: 17),
                    //   ),
                    // ),
                    // const SizedBox(height: 30),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (userEmailAddress) {
                        // signInController.userEmailAddress = userEmailAddress;
                      },
                      onChanged: (userEmailAddress) {
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
                        prefixIcon: Icon(Icons.medical_information,
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
                        controller: addMedecineController
                            .dateinput, //editing controller of this TextField
                        decoration: InputDecoration(
                          hintText: "Date",
                          errorMaxLines: 2,
                          prefixIcon: Icon(Icons.calendar_month,
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
                          // DateTime? pickedDate = await showDatePicker(
                          //     context: context,
                          //     initialDate: DateTime.now(),
                          //     firstDate: DateTime(
                          //         2000), //DateTime.now() - not to allow to choose before today.
                          //     lastDate: DateTime(2101));

                          // if (pickedDate != null) {
                          //   print(
                          //       pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          //   String formattedDate =
                          //       DateFormat('yyyy-MM-dd').format(pickedDate);
                          //   print(
                          //       formattedDate); //formatted date output using intl package =>  2021-03-16
                          //   //you can implement different kind of Date Format here according to your requirement

                          //   // setState(() {
                          //   //    dateinput.text = formattedDate; //set output date to TextField value.
                          //   // });
                          // } else {
                          //   print("Date is not selected");
                          // }
                        },
                      ),
                    ),

                    const SizedBox(height: 20),
                    // GetBuilder<AddMedecineController>(
                    //   builder: (contx) => TextFormField(
                    //     textInputAction: TextInputAction.next,
                    //     keyboardType: TextInputType.visiblePassword,
                    //     // obscureText: contx.showPassword,
                    //     // onSaved: (userpass) {
                    //     //   signInController.userPassword = userpass;
                    //     // },
                    //     // onChanged: (userpass) {
                    //     //   signInController.userPassword = userpass.trim();
                    //     // },
                    //     validator: (value) {
                    //       if (value!.isEmpty) {
                    //         return "enterPassword".tr;
                    //       }
                    //       if (value.length > 20) {
                    //         return "password>20".tr;
                    //       }
                    //       if (value.length < 8) {
                    //         return "password<8".tr;
                    //       }
                    //       return null;
                    //     },
                    //     initialValue: signInController.userPassword,
                    //     decoration: InputDecoration(
                    //       hintText: 'password'.tr,
                    //       errorMaxLines: 2,
                    //       prefixIcon:
                    //           Icon(Icons.lock, color: AppColors.kLine),
                    //       suffixIcon: IconButton(
                    //           onPressed: () {
                    //             contx.invertShowPassword();
                    //           },
                    //           icon: contx.showPassword
                    //               ? const Icon(Icons.visibility)
                    //               : const Icon(Icons.visibility_off)),
                    //       suffixIconColor: AppColors.kPrimary2,
                    //       contentPadding: const EdgeInsets.symmetric(
                    //           horizontal: 20, vertical: 16),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide:
                    //             const BorderSide(color: AppColors.kLine),
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide:
                    //             const BorderSide(color: AppColors.kPrimary2),
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       border: OutlineInputBorder(
                    //         borderSide:
                    //             const BorderSide(color: AppColors.kLine),
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       errorBorder: OutlineInputBorder(
                    //         borderSide:
                    //             const BorderSide(color: AppColors.KError),
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       hintStyle: const TextStyle(
                    //           fontSize: 14,
                    //           fontWeight: FontWeight.w300,
                    //           color: Colors.grey),
                    //     ),
                    //   ),
                    // ),
                    // TextField(
                    //   // controller: dateInput,
                    //   //editing controller of this TextField
                    //   controller: addMedecineController.medecineDateExpir2,
                    //   decoration: const InputDecoration(
                    //     hintText: "Date",
                    //     icon: Icon(Icons.calendar_today), //icon of text field
                    //   ),
                    //   readOnly: true,
                    //   //set it true, so that user will not able to edit text
                    //   onTap: () async {
                    //   //  addMedecineController.pickedDate(context);
                    //     DateTime? pickedDate = await showDatePicker(
                    //         context: context,
                    //         initialDate: DateTime.now(),
                    //         firstDate: DateTime(1950),
                    //         //DateTime.now() - not to allow to choose before today.
                    //         lastDate: DateTime(2100));

                    //     if (pickedDate != null) {
                    //       print(
                    //           pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    //       String formattedDate =
                    //           DateFormat('yyyy-MM-dd').format(pickedDate);
                    //       print(
                    //           formattedDate); //formatted date output using intl package =>  2021-03-16
                    //           addMedecineController.medecineDateExpir2=formattedDate as TextEditingController?;
                    //           print(addMedecineController.medecineDateExpir2?.text);
                    //       // setState(() {
                    //       //   dateInput.text =
                    //       //       formattedDate; //set output date to TextField value.
                    //       // });
                    //     } else {}
                    //   },
                    // ),

                    TextButton(
                      onPressed: () {
                        if (addMedecineController.formKey.currentState!
                            .validate()) {
                          addMedecineController.formKey.currentState!.save();
                          // signInController.signInAUser();
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
                                  side: BorderSide(
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
                            "login".tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Align(
                    //   alignment: Alignment.center,
                    //   child: InkWell(
                    //     child: const Text(
                    //       "Create a new account",
                    //       style: TextStyle(
                    //         color: AppColors.kPrimary2,
                    //       ),
                    //     ),
                    //     onTap: () {
                    //       // Get.toNamed("/SignUp");
                    //     },
                    //   ),
                    // ),
                    // const Text('Already a member?',
                    //     style: TextStyle(
                    //       fontSize: 18,
                    //       color: AppColors.kPrimary2,
                    //     )),
                    // TextButton(
                    //   onPressed: () {
                    //     // Get.toNamed("SignUp");
                    //   },
                    //   style:
                    //       TextButton.styleFrom(padding: EdgeInsets.zero),
                    //   child: Text(
                    //     " Sign Up",
                    //     style: TextStyle(
                    //         color: AppColors.kPrimary2, fontSize: 18),
                    //   ),
                    // )
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
