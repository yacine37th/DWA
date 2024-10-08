import 'package:dwa/controller/home_controller.dart';
import 'package:dwa/functions/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/main_colors.dart';
import 'widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth(BuildContext context) {
      return MediaQuery.of(context).size.width;
    }

    HomeController homeController = Get.find();
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: InkWell(
              onTap: () {
                Get.toNamed(
                  "/SearchScreen",
                );
              },
              //  prefixIcon: ImageIcon(
              //         Svg("assets/icons/search_icon.svg"),
              //         size: 20,
              //       ),
              child: Stack(children: [
                TextField(
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'SearchMed'.tr,
                    errorMaxLines: 2,
                    prefixIcon: Icon(Icons.search,
                        color: AppColors.kPrimary2, size: 30),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.kLine),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.kPrimary2),
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
                  enabled: false,
                ),
              ]),
            ),
          ),
          Expanded(
            child: GetBuilder<HomeController>(
                builder: (contx) => contx.medecines.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                        // backgroundColor: AppColors.kBackground,
                        color: AppColors.kPrimary2,
                      ))
                    : GetBuilder<HomeController>(
                        builder: (contxe) => ListView.builder(
                          // scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          // gridDelegate:
                          //     SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          itemCount: homeController.medecines.length,
                          controller: homeController.scrollController,
                          // padding: const EdgeInsets.all(2.0),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed('/MedecineDetails', arguments: {
                                  "0": contx.medecines.values.elementAt(index)
                                });
                                print("dede");
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: AppColors.kPrimary3, width: 0.5),
                                    borderRadius: BorderRadius.circular(15.0)),

                                elevation: 5, // Change this
                                shadowColor: Colors.black12,
                                margin: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(),
                                      height: 150,
                                      width: double.infinity,
                                      // alignment: Alignment.center,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "${homeController.medecines.values.elementAt(index).image}",
                                        fit: BoxFit.contain,
                                        progressIndicatorBuilder:
                                            (context, child, loadingProgress) {
                                          return Center(
                                            child: CircularProgressIndicator(
                                              value: loadingProgress.progress,
                                              color: AppColors.kPrimary2,
                                            ),
                                          );
                                        },
                                      ),
                                    ),

                                    // Image.network(
                                    //   "${contx.medecines.elementAt(index).image}",
                                    //   fit: BoxFit.cover,
                                    //   height: 150.0,
                                    //   width: double.infinity,
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            '''${homeController.medecines.values.elementAt(index).name!.length > 15 ? homeController.medecines.values.elementAt(index).name!.substring(0, 15) + "..." : homeController.medecines.values.elementAt(index).name!}''',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                          const SizedBox(height: 8.0),
                                          Text(
                                            "${contx.medecines.values.elementAt(index).category}",
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(height: 8.0),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                // }
                ),
          ),
        ],
      ),
      floatingActionButton: GetBuilder<HomeController>(
        builder: (contex) => FloatingActionButton(
          backgroundColor: AppColors.kPrimary2,
          // foregroundColor: ,
          // mini: true,
          onPressed: () async {
            final SharedPreferences prefs = await contex.sahredPrefs;

            // if (prefs.getString("appIsOppen") != null) {
            //   Get.toNamed("/SignIn", arguments: "home");
            //   print(prefs.getString("appIsOppen"));
            // } else {
            //   Get.toNamed("/AddMedecine");
            //   prefs.setString("appIsOppen", "true");
            //   // print("Last page ");
            // }

            Get.toNamed("/SignIn", arguments: "home");
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
