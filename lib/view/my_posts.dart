import 'package:dwa/controller/my_posts_controller.dart';
import 'package:dwa/model/medecine_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../theme/main_colors.dart';

class MyPosts extends StatelessWidget {
  const MyPosts({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth(BuildContext context) {
      return MediaQuery.of(context).size.width;
    }

    MyPostsController myPostsController = Get.find();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu)),
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
          iconTheme: IconThemeData(color: Colors.black),
          // actions: <Widget>[
          //   Row(
          //     children: [
          //       // IconButton(
          //       //   onPressed: () {},
          //       //   icon: Icon(
          //       //     Icons.shopping_basket,
          //       //     color: Colors.grey[800],
          //       //   ),
          //       // ),
          //       SizedBox(
          //         height: 48,
          //         width: 48,
          //         child: Stack(
          //           alignment: Alignment.bottomRight,
          //           children: [
          //             Container(
          //               height: 48,
          //               width: 48,
          //               child: ProfilePicture(),
          //               decoration: const BoxDecoration(
          //                 shape: BoxShape.circle,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       SizedBox(
          //         width: 8,
          //       ),
          //       ],
          //   ),
          // ],

          bottom: PreferredSize(
              preferredSize: Size(0, 0),
              child: Container(
                color: AppColors.kPrimary2,
                height: 1,
              )),
        ),
        body: GetBuilder<MyPostsController>(builder: (contx) {
          if (contx.myPosts.isEmpty) {
            return Center(
              child: Text(
                "ListEmpty".tr,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return GridView.builder(
              physics: BouncingScrollPhysics(),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: contx.myPosts.length,
              padding: EdgeInsets.all(2.0),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // Get.toNamed('/FoodDetails', arguments: {
                    //   "0": contx.myPosts.values.elementAt(index)
                    // });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      width: (screenWidth(context) / 2) - 15,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        image: DecorationImage(
                          image: NetworkImage(
                              "${contx.myPosts.values.elementAt(index).image}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            gradient: new LinearGradient(
                                colors: [
                                  Colors.black,
                                  const Color(0x19000000),
                                ],
                                begin: const FractionalOffset(0.0, 1.0),
                                end: const FractionalOffset(0.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${myPostsController.myPosts.values.elementAt(index).name!.length > 7 ? "${myPostsController.myPosts.values.elementAt(index).name!.substring(0, 5)}..." : myPostsController.myPosts.values.elementAt(index).name}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                // Text(
                                //   'Rs. ${contx.myPosts.values.elementAt(index).price}',
                                //   style: TextStyle(
                                //       fontSize: 20,
                                //       fontWeight: FontWeight.w200,
                                //       color: Colors.white),
                                // ),
                                // PopupMenuButton(
                                //   color: Colors.white,
                                //   icon: const Icon(Icons.more_vert),
                                //   itemBuilder: (BuildContext context) =>
                                //       <PopupMenuEntry>[
                                //     // const PopupMenuItem(
                                //     //   child: ListTile(
                                //     //     leading: Icon(Icons.add, color  : Color(0xff4338CA)),
                                //     //     title: Text('Add video'),
                                //     //   ),
                                //     // ),
                                //     // const PopupMenuDivider(),
                                //     PopupMenuItem(
                                //       onTap: () {
                                //         print(
                                //             "${myPostsController.myPosts.values.elementAt(index).name}");
                                //       },
                                //       child: Text("Supprimer"),
                                //     ),
                                //     PopupMenuItem(
                                //       onTap: () {
                                //         // Navigator.pop(context);
                                //       },
                                //       child: Text("Anuller"),
                                //     ),
                                //   ],
                                // ),

                                DropDownMenuFb1(
                                  post: myPostsController.myPosts.values
                                      .elementAt(index),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ), /* add child content here */
                    ),
                  ),
                );
              },
            );
          }
        }));
  }
}

class DropDownMenuFb1 extends StatelessWidget {
  // final Color color;
  // final Widget icon;
  late MedecineModel? post;
  DropDownMenuFb1({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    MyPostsController myPostsController = Get.find();
    return PopupMenuButton(
      color: Colors.white,
      icon: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        // const PopupMenuItem(
        //   child: ListTile(
        //     leading: Icon(Icons.add, color  : Color(0xff4338CA)),
        //     title: Text('Add video'),
        //   ),
        // ),
        // const PopupMenuDivider(),
        PopupMenuItem(
          onTap: () {
            print("${post!.name}");
            myPostsController.deleteFromMyPosts(post!.id, post!);
          },
          child: Text("Supprimer".tr),
        ),
        PopupMenuItem(
          onTap: () {
            // Navigator.pop(context);
          },
          child: Text("Annuler".tr),
        ),
      ],
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
