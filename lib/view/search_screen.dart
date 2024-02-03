import 'package:cached_network_image/cached_network_image.dart';
import 'package:dwa/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors.dart';
import '../theme/main_colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchControllerr searchController = Get.find();
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
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.kPrimary2,
              // size: 18,
            )),
        bottom: PreferredSize(
            preferredSize: Size(0, 0),
            child: Container(
              color: AppColors.kPrimary2,
              height: 1,
            )),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: TextField(
            autofocus: true,
            style: const TextStyle(color: Colors.black),
            textInputAction: TextInputAction.go,
            cursorColor: blackColor,
            decoration: InputDecoration(
              hintText: 'SearchMed'.tr,
              errorMaxLines: 2,
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.kPrimary2,
                size: 30,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
            onChanged: (input) {
              searchController.getInputSearch(input);
            },
            onEditingComplete: () {
              if (searchController.inputSearch!.isNotEmpty) {
                searchController
                    .getSearched(searchController.inputSearch!.trim());
              }
            },
            onSubmitted: (inputSearch) {
              if (inputSearch.isNotEmpty) {
                searchController.getSearched(inputSearch.trim());
              }
            },
          ),
        ),
      ),
      body: GetBuilder<SearchControllerr>(builder: (context) {
        if (searchController.inputSearch!.isEmpty) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "SearchMed".tr,
                style: const TextStyle(fontFamily: 'Cairo', fontSize: 19 ,  fontWeight: FontWeight.bold),
              ),
            ],
          ));
        } else if (searchController.searchMedecine.isEmpty &&
            searchController.inputSearch!.isNotEmpty) {
          if (!searchController.isFetching) {
            return Stack(children: [
              Center(
                child: Text(
                  "NoResultForSearch".tr,
                  style: const TextStyle(fontFamily: 'Cairo', fontSize: 19 , fontWeight: FontWeight.bold),
                ),
              ),
            ]);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        } else {
          return ListView(
            // controller: searchController.scrollController,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(0, 10, 0, 40),
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: searchController.searchMedecine.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed('/MedecineDetails', arguments: {
                        "0": searchController.searchMedecine.values
                            .elementAt(index)
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
                                  "${searchController.searchMedecine.values.elementAt(index).image}",
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '''${searchController.searchMedecine.values.elementAt(index).name!.length > 15 ? searchController.searchMedecine.values.elementAt(index).name!.substring(0, 15) + "..." : searchController.searchMedecine.values.elementAt(index).name!}''',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  "${searchController.searchMedecine.values.elementAt(index).category}",
                                  style: const TextStyle(color: Colors.grey),
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
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
              ),
              GetBuilder<SearchControllerr>(
                builder: (context) {
                  if (searchController.isFetching) {
                    return Column(
                      children: const [
                        SizedBox(height: 60),
                        Center(child: CircularProgressIndicator()),
                        SizedBox(height: 60)
                      ],
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              )
            ],
          );
        }
      }),

      // GetBuilder<SearchControllerr>(
      //     builder: (contx) => contx.searchMedecine.isEmpty
      //         ? const Center(
      //             child: CircularProgressIndicator(
      //             // backgroundColor: AppColors.kBackground,
      //             color: AppColors.kPrimary2,
      //           ))
      //         : GetBuilder<SearchControllerr>(
      //             builder: (contxe) => ListView.builder(
      //               // scrollDirection: Axis.horizontal,
      //               physics: BouncingScrollPhysics(),
      //               // gridDelegate:
      //               //     SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      //               itemCount: searchController.searchMedecine.length,
      //               // controller: searchController.scrollController,
      //               // padding: const EdgeInsets.all(2.0),
      //               itemBuilder: (BuildContext context, int index) {
      //                 return GestureDetector(
      //                   onTap: () {
      //                     Get.toNamed('/MedecineDetails', arguments: {
      //                       "0": contx.searchMedecine.values.elementAt(index)
      //                     });
      //                     print("dede");
      //                   },
      //                   child: Card(
      //                     shape: RoundedRectangleBorder(
      //                         side: const BorderSide(
      //                             color: AppColors.kPrimary3, width: 0.5),
      //                         borderRadius: BorderRadius.circular(15.0)),

      //                     elevation: 5, // Change this
      //                     shadowColor: Colors.black12,
      //                     margin: const EdgeInsets.all(15.0),
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Container(
      //                           decoration: BoxDecoration(),
      //                           height: 150,
      //                           width: double.infinity,
      //                           // alignment: Alignment.center,
      //                           child: CachedNetworkImage(
      //                             imageUrl:
      //                                 "${searchController.searchMedecine.values.elementAt(index).image}",
      //                             fit: BoxFit.contain,
      //                             progressIndicatorBuilder:
      //                                 (context, child, loadingProgress) {
      //                               return Center(
      //                                 child: CircularProgressIndicator(
      //                                   value: loadingProgress.progress,
      //                                   color: AppColors.kPrimary2,
      //                                 ),
      //                               );
      //                             },
      //                           ),
      //                         ),

      //                         // Image.network(
      //                         //   "${contx.searchMedecine.elementAt(index).image}",
      //                         //   fit: BoxFit.cover,
      //                         //   height: 150.0,
      //                         //   width: double.infinity,
      //                         // ),
      //                         Padding(
      //                           padding: const EdgeInsets.all(8.0),
      //                           child: Column(
      //                             crossAxisAlignment:
      //                                 CrossAxisAlignment.start,
      //                             mainAxisAlignment:
      //                                 MainAxisAlignment.start,
      //                             children: [
      //                               Text(
      //                                 '''${searchController.searchMedecine.values.elementAt(index).name!.length > 15 ? searchController.searchMedecine.values.elementAt(index).name!.substring(0, 15) + "..." : searchController.searchMedecine.values.elementAt(index).name!}''',
      //                                 style: const TextStyle(
      //                                     fontWeight: FontWeight.bold,
      //                                     fontSize: 18.0),
      //                               ),
      //                               const SizedBox(height: 8.0),
      //                               Text(
      //                                 "${contx.searchMedecine.values.elementAt(index).category}",
      //                                 style: const TextStyle(
      //                                     color: Colors.grey),
      //                               ),
      //                               const SizedBox(height: 8.0),
      //                             ],
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 );
      //               },
      //             ),
      //           )
      //     // }
      //     ),
    );
  }
}
