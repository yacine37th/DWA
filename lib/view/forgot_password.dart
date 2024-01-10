import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/forgot_password_controller.dart';
import '../theme/main_colors.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController forgotPasswordController = Get.find();
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              navigator!.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.kPrimary2,
              // size: 18,
            )),
      ),
      // backgroundColor: AppColors.kBackground,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          height: screenHeight / 1.35,
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: forgotPasswordController.pageController,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "forgotYourPassword?".tr,
                    style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "forgotPasswordMessage".tr,
                    style: const TextStyle(fontSize: 17),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Form(
                    key: forgotPasswordController.emailFormKey,
                    child: Column(children: [
                      GetBuilder<ForgotPasswordController>(builder: (context) {
                        return TextFormField(
                          style: const TextStyle(color: Colors.black),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "enterAnEmail".tr;
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                .hasMatch(val)) {
                              return "enterValidEmail".tr;
                            }
                            return null;
                          },
                          onChanged: (emailAddress) {
                            forgotPasswordController
                                .inputfgbEmail(emailAddress);
                          },
                          decoration: InputDecoration(
                            hintText: 'email'.tr,
                            errorMaxLines: 2,
                            prefixIcon:
                                const Icon(Icons.email, color: AppColors.kLine),
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
                        );
                      }),
                      const SizedBox(
                        height: 25,
                      ),
                      TextButton(
                        onPressed: () {
                          if (forgotPasswordController
                              .emailFormKey.currentState!
                              .validate()) {
                            forgotPasswordController.emailFormKey.currentState!
                                .save();
                            forgotPasswordController.sendEmail();
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
                                (states) => AppColors.kPrimary2Onpress
                                    .withOpacity(0.2)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
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
                            child:  Text(
                              "SendLink".tr,
                              style:const TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // GestureDetector(
                      //   onTap: () {
                      //     if (forgotPasswordController
                      //         .emailFormKey.currentState!
                      //         .validate()) {
                      //       forgotPasswordController.emailFormKey.currentState!
                      //           .save();
                      //       forgotPasswordController.sendEmail();
                      //     }
                      //   },
                      //   child: Card(
                      //     elevation: 0,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(100),
                      //     ),
                      //     child: Container(
                      //       height: 55,
                      //       alignment: Alignment.center,
                      //       width: double.maxFinite,
                      //       decoration: BoxDecoration(
                      //         color: AppColors.kPrimary2,
                      //         borderRadius: BorderRadius.circular(30),
                      //       ),
                      //       child: Text(
                      //         "Send link",
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 15,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ]),
                  )
                ],
              ),
              Column(
                children: [
                  Text.rich(TextSpan(
                      style: const TextStyle(fontFamily: 'Cairo', fontSize: 17),
                      children: [
                         TextSpan(
                            text:
                                "sendingEmailMessage".tr),
                        TextSpan(
                            text: forgotPasswordController.fgpEmail.toString())
                      ])),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      navigator!.pop();
                    },
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                          AppColors.kPrimary2,
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          AppColors.kPrimary2,
                        ),
                        overlayColor: MaterialStateColor.resolveWith((states) =>
                            AppColors.kPrimary2Onpress.withOpacity(0.2)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
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
                        child:  Text(
                          "continue".tr,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
