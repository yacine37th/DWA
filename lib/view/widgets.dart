import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../functions/functions.dart';
import '../main.dart';
import '../theme/main_colors.dart';

// class AppBarr extends StatelessWidget {
//   final text;
//   const AppBarr({super.key, this.text});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: AppColors.kBackground,
//       elevation: 0,
//       leading: IconButton(
//           onPressed: () {
//             navigator!.pop();
//           },
//           icon: Icon(
//             Icons.arrow_back_ios_outlined,
//             color: AppColors.kPrimary2,
//             // size: 18,
//           )),
//       title: Text(text ?? null),
//       //        actions: [
//       //   Icon(Icons.favorite),
//       //   Padding(
//       //     padding: EdgeInsets.symmetric(horizontal: 16),
//       //     child: Icon(Icons.search),
//       //   ),
//       //   Icon(Icons.more_vert),
//       // ],
//     );
//   }
// }

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key, this.photoUrl});
  final String? photoUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ClipOval(
            child: currentUser != null
                ? Container(
                    alignment: Alignment.center,
                    color: MainFunctions.generatePresizedColor(
                        currentUserInfos.name!.length),
                    child: Text(
                      currentUserInfos.name![0].toUpperCase(),
                      style: const TextStyle(fontSize: 27),
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/login_profil_picture.png",
                    ),
                  )));
  }
}

class MedecinePicture extends StatelessWidget {
  final String foodPicUrl;
  const MedecinePicture({super.key, required this.foodPicUrl});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          height: 250,

          width: double.infinity,
          decoration: BoxDecoration(
            // color: AppColors.kBackground,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0)),
            image: DecorationImage(
                image: NetworkImage(foodPicUrl), fit: BoxFit.cover),
          ),
          child: const SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ArrowBack(),
                ],
              ),
            ),
          ),
          //   Image.network(
          //   "$foodPicUrl"
          // ),
          //
        ),
      ],
    );
  }
}

class ArrowBack extends StatelessWidget {
  const ArrowBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: AppColors.kPrimary2,
        child: Center(
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: AppColors.whiteColor,
          ),
        ));
  }
}

class FoodName extends StatelessWidget {
  final String foodName;
  final String cate;
  final String date;
  const FoodName(
      {super.key,
      required this.foodName,
      required this.cate,
      required this.date});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(foodName,
            style: const TextStyle(
                color: Colors.black, fontSize: 25, fontFamily: "Roboto")),
        const SizedBox(
          height: 5,
        ),
        Text(cate, style: const TextStyle(color: Colors.black45, fontSize: 18)),
        const SizedBox(
          height: 5,
        ),
        Text("Date Expiration : ${date}",
            style: const TextStyle(color: Colors.black45, fontSize: 18)),
      ]),
    );
  }
}
