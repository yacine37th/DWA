import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/main_colors.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  bool showPassword = true;

  String? userName;
  String? userEmailAddress;
  String? userPassword;

  invertShowPassword() {
    showPassword = !showPassword;
    update();
  }

  createNewUser() async {
    Get.defaultDialog(
        title: "pleaseWait".tr,
        content: const CircularProgressIndicator(
          color: AppColors.kPrimary2,
        ));
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userEmailAddress!,
        password: userPassword!,
      );

      FirebaseFirestore.instance
          .collection("users")
          .doc(credential.user!.uid)
          .set({
        "userID": credential.user!.uid,
        "userName": userName,
        "userEmail": userEmailAddress,
      });
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
      Get.back();
      Get.toNamed("/EmailVerification");
    } on FirebaseAuthException catch (e) {
      Get.back();

      if (e.code == 'weak-password') {
        Get.defaultDialog(
          title: "Le mot de passe est faible, veuillez le changer",
          content: const Icon(
            Icons.report_problem,
            color: Colors.red,
          ),
          onConfirm: () {
            Get.back();
          },
        );
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
          title: "email-already-in-use".tr,
          content: const Icon(
            Icons.report_problem,
            color: Colors.red,
          ),
          onConfirm: () {
            Get.back();
          },
        );
      }
    } catch (e) {
      Get.back();
      Get.defaultDialog(
        title: "Something is wrong",
        content: const Icon(
          Icons.report_problem,
          color: Colors.red,
        ),
        onConfirm: () {
          Get.back();
        },
      );
    }
  }

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn = GoogleSignIn();

// Future<String> signInWithGoogle() async {
//   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//   final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount.authentication;

//   final AuthCredential credential = GoogleAuthProvider.getCredential(
//     accessToken: googleSignInAuthentication.accessToken,
//     idToken: googleSignInAuthentication.idToken,
//   );

//   final AuthResult authResult = await _auth.signInWithCredential(credential);
//   final FirebaseUser user = authResult.user;

//   assert(!user.isAnonymous);
//   assert(await user.getIdToken() != null);

//   final FirebaseUser currentUser = await _auth.currentUser();
//   assert(user.uid == currentUser.uid);

//   return 'signInWithGoogle succeeded: $user';
// }

//   Future<dynamic> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//       final GoogleSignInAuthentication? googleAuth =
//           await googleUser?.authentication;

//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );

//       return await FirebaseAuth.instance.signInWithCredential(credential);
//     } on Exception catch (e) {
//       // TODO
//       print('exception->$e');
//     }
//   }

//   Future<bool> signOutFromGoogle() async {
//     try {
//       await FirebaseAuth.instance.signOut();
//       return true;
//     } on Exception catch (_) {
//       return false;
//     }
//   }
// // Future<void> linkGoogleAndTwitter() async {
//   // Trigger the Google Authentication flow.
//   final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
//   // Obtain the auth details from the request.
//   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//   // Create a new credential.
//   final GoogleAuthCredential googleCredential = GoogleAuthProvider.credential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );
//   // Sign in to Firebase with the Google [UserCredential].
//   final UserCredential googleUserCredential =
//     await FirebaseAuth.instance.signInWithCredential(googleCredential);

//   // Now let's link Twitter to the currently signed in account.
//   // Create a [TwitterLogin] instance.
//   final TwitterLogin twitterLogin = new TwitterLogin(
//     consumerKey: consumerKey,
//     consumerSecret: consumerSecret
//   );
//   // Trigger the sign-in flow.
//   final TwitterLoginResult loginResult = await twitterLogin.authorize();
//   // Get the logged in session.
//   final TwitterSession twitterSession = loginResult.session;
//   // Create a [AuthCredential] from the access token.
//   final AuthCredential twitterAuthCredential =
//     TwitterAuthProvider.credential(
//       accessToken: twitterSession.token,
//       secret: twitterSession.secret
//      );
//   // Link the Twitter account to the Google account.
//   await googleUserCredential.user.linkWithCredential(twitterAuthCredential);
// }
}
