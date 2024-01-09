import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../animation/fade_animation.dart';
import '../controller/signup_constroller.dart';
import '../theme/assets.dart';
import '../theme/main_colors.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = Get.find();

    return Scaffold(
      appBar: AppBar(
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
      // backgroundColor: AppColors.kBackground,
      body: SafeArea(
        child: ListView(
          clipBehavior: Clip.antiAlias,
          physics: const BouncingScrollPhysics(),
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: signUpController.formKey,
                child: FadeAnimation(
                  delay: 1,
                  child: Column(
                    children: [
                      // const SizedBox(height: 10),
                      Center(child: Image.asset(AppAssets.kAppLogo)),
                      const SizedBox(height: 30),
                      const Text('Sign Up',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      const SizedBox(height: 24),

                      const SizedBox(height: 30),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (username) {
                          signUpController.userName = username;
                        },
                        onChanged: (username) {
                          signUpController.userName = username.trim();
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please fill Your Username";
                          }
                          if (!RegExp(r'^[a-zA-Z]+$').hasMatch(val)) {
                            return "Please fill With a valid Username";
                          }
                          return null;
                        },
                        initialValue: signUpController.userName,
                        decoration: InputDecoration(
                          hintText: 'Your Username',
                          errorMaxLines: 2,
                          prefixIcon:
                              Icon(Icons.person, color: AppColors.kLine),
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
                      const SizedBox(height: 20),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (userEmailAddress) {
                          signUpController.userEmailAddress = userEmailAddress;
                        },
                        onChanged: (userEmailAddress) {
                          signUpController.userEmailAddress =
                              userEmailAddress.trim();
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please fill Your Email ";
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                              .hasMatch(val)) {
                            return "Please fill With a valid Email Address";
                          }
                          return null;
                        },
                        initialValue: signUpController.userEmailAddress,
                        decoration: InputDecoration(
                          hintText: 'Your Email',
                          errorMaxLines: 2,
                          prefixIcon: Icon(Icons.email, color: AppColors.kLine),
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
                      const SizedBox(height: 20),
                      GetBuilder<SignUpController>(
                        builder: (contx) => TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: contx.showPassword,
                          onSaved: (userpass) {
                            signUpController.userPassword = userpass;
                          },
                          onChanged: (userpass) {
                            signUpController.userPassword = userpass.trim();
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please fill in the password";
                            }
                            if (value.length > 20) {
                              return "The password cannot exceed 20 characters";
                            }
                            if (value.length < 8) {
                              return "The password cannot contain less than 8 characters";
                            }
                            return null;
                          },
                          initialValue: signUpController.userPassword,
                          decoration: InputDecoration(
                            hintText: 'Your Password',
                            errorMaxLines: 2,
                            prefixIcon:
                                Icon(Icons.lock, color: AppColors.kLine),
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
                      const SizedBox(height: 30),
                      TextButton(
                        onPressed: () {
                          signUpController.createNewUser();
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
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // GestureDetector(
                      //   onTap: () {
                      //     if (signUpController.formKey.currentState!
                      //         .validate()) {
                      //       signUpController.formKey.currentState!.save();
                      //       signUpController.createNewUser();
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
                      //         "Sign Up",
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 15,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
