import 'package:dwa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../animation/fade_animation.dart';
import '../controller/singin_controller.dart';
import '../main.dart';
import '../theme/assets.dart';
import '../theme/main_colors.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    SignInController signInController = Get.find();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
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
              if (prevVerfiy) {
                Get.offAllNamed("/");
                prevVerfiy = false;
              } else {
                navigator!.pop();
              }
              // navigator!.pop();
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
      // backgroundColor: AppColors.kBackground,
      body: SafeArea(
        child: ListView(
          clipBehavior: Clip.antiAlias,
          physics: const BouncingScrollPhysics(),
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: signInController.formKey,
                child: Column(
                  children: [
                    // const SizedBox(height: 60),
                    Container(
                      width: double.infinity,
                      height: 250,
                      child: Image.asset(AppAssets.kAppLogo),
                    ),
                    // const SizedBox(height: 30),
                    Text('login'.tr,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
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
                        signInController.userEmailAddress = userEmailAddress;
                      },
                      onChanged: (userEmailAddress) {
                        signInController.userEmailAddress =
                            userEmailAddress.trim();
                      },
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
                      initialValue: signInController.userEmailAddress,
                      decoration: InputDecoration(
                        hintText: 'email'.tr,
                        errorMaxLines: 2,
                        prefixIcon: Icon(Icons.email, color: AppColors.kLine),
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
                    GetBuilder<SignInController>(
                      builder: (contx) => TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: contx.showPassword,
                        onSaved: (userpass) {
                          signInController.userPassword = userpass;
                        },
                        onChanged: (userpass) {
                          signInController.userPassword = userpass.trim();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "enterPassword".tr;
                          }
                          if (value.length > 20) {
                            return "password>20".tr;
                          }
                          if (value.length < 8) {
                            return "password<8".tr;
                          }
                          return null;
                        },
                        initialValue: signInController.userPassword,
                        decoration: InputDecoration(
                          hintText: 'password'.tr,
                          errorMaxLines: 2,
                          prefixIcon: Icon(Icons.lock, color: AppColors.kLine),
                          suffixIcon: IconButton(
                              onPressed: () {
                                contx.invertShowPassword();
                              },
                              icon: contx.showPassword
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                          suffixIconColor: AppColors.kPrimary2,
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
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.toNamed("ForgotPassword");
                          },
                          style: ButtonStyle(
                            overlayColor: MaterialStateColor.resolveWith(
                                (states) => AppColors.kPrimary2Onpress
                                    .withOpacity(0.2)),
                          ),
                          child: Text(
                            // "Forgot Password ?"
                            "forgotYourPassword?".tr,
                            style: TextStyle(
                                color: AppColors.kPrimary2, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    TextButton(
                      onPressed: () {
                        if (signInController.formKey.currentState!.validate()) {
                          signInController.formKey.currentState!.save();
                          signInController.signInAUser();
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

                    TextButton(
                      onPressed: () {
                        Get.toNamed("/SignUp");
                      },
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                            AppColors.kPrimary2,
                          ),
                          // backgroundColor: MaterialStateProperty.all(
                          //   AppColors.kPrimary2,
                          // ),
                          // textStyle: MaterialStatePropertyAll(),
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
                            // border: Border.all(color: AppColors.kPrimary),
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                          child: Text(
                            "createAccount".tr,
                            style: const TextStyle(
                                color: AppColors.kPrimary2,
                                fontSize: 19,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),

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
