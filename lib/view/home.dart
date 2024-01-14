import 'package:dwa/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
          // Text("data"),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
            child: InkWell(
              onTap: () {
                Get.toNamed(
                  "/SearchScreen",
                );
              },
              child: TextField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_outlined),
                    prefixIconColor: AppColors.kPrimary2,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    focusColor: AppColors.kPrimary2,
                    fillColor: AppColors.kPrimary2,
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.kPrimary2)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.kPrimary2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.kPrimary2)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.kPrimary2)),
                    hintStyle: TextStyle(
                        color: AppColors.kPrimary2,
                        fontFamily: 'Cairo',
                        fontSize: 15),
                    hintText: "ابحث عن كتاب أو مؤلف"),
                enabled: false,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: GetBuilder<HomeController>(builder: (contx) {
                if (contx.medecines.isEmpty) {
                  return const Center(
                    child: Text(
                      "List Empty",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  );
                } else {
                  return ListView.builder(
                    // scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    // gridDelegate:
                    //     SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: contx.medecines.length,
                    padding: EdgeInsets.all(2.0),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        // onTap: () {
                        //   Get.toNamed('/FoodDetails', arguments: {
                        //     "0": contx.medecines.elementAt(index)
                        //   });
                        // },

                        child: Card(
                          margin: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 150,
                                width: double.infinity,
                                // alignment: Alignment.center,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${contx.medecines.values.elementAt(index).image}",
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, child, loadingProgress) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                          value: loadingProgress.progress
                                          ,color: AppColors.kPrimary2,
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
                                  children: [
                                    Text(
                                      "${contx.medecines.values.elementAt(index).name}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      "${contx.medecines.values.elementAt(index).description}",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(height: 8.0),
                                    // Text(
                                    //   '\$${product.price.toString()}',
                                    //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // child: Padding(
                        //   padding: EdgeInsets.all(5),
                        //   child: Column(
                        //     children: [
                        //       Container(
                        //         height: 150,
                        //             decoration: BoxDecoration(
                        //       shape: BoxShape.rectangle,
                        //       borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        //       image: DecorationImage(
                        //         image: NetworkImage(
                        //             "${contx.medecines.elementAt(index).image}"),
                        //         fit: BoxFit.cover,
                        //       ),)
                        //       ),
                        //       // Container(
                        //       //   // width: 250,
                        //       //   decoration: BoxDecoration(
                        //       //       borderRadius:
                        //       //           const BorderRadius.all(Radius.circular(5)),
                        //       //       // border: Border.all(color: Colors.red)
                        //       //       ),
                        //       //   child: ClipRRect(
                        //       //       borderRadius: BorderRadius.circular(5),
                        //       //       child: Container(
                        //       //         width: (screenWidth(context) / 2) - 15,
                        //       //         height: 140,
                        //       //         decoration: BoxDecoration(
                        //       //           shape: BoxShape.rectangle,
                        //       //           borderRadius:
                        //       //               BorderRadius.all(Radius.circular(15.0)),
                        //       //           image: DecorationImage(
                        //       //             image: NetworkImage(
                        //       //               "${contx.medecines.elementAt(index).image}",
                        //       //             ),
                        //       //             fit: BoxFit.cover,
                        //       //           ),
                        //       //         ),
                        //       //       )),
                        //       //   //    CachedNetworkImage(
                        //       //   //     imageUrl:
                        //       //   //         "${contx.medecines.elementAt(index).image}",
                        //       //   //     fit: BoxFit.cover,
                        //       //   //     progressIndicatorBuilder:
                        //       //   //         (context, child, loadingProgress) {
                        //       //   //       return Center(
                        //       //   //         child: CircularProgressIndicator(
                        //       //   //             value: loadingProgress.progress),
                        //       //   //       );
                        //       //   //     },
                        //       //   //   ),
                        //       //   // ),
                        //       // ),

                        //       SizedBox(
                        //         height: 20,
                        //       ),
                        //       Text(
                        //         "${contx.medecines.elementAt(index).name}",
                        //         style: TextStyle(
                        //             fontSize: 16, fontWeight: FontWeight.bold),
                        //       ),
                        //       SizedBox(
                        //         height: 20,
                        //       ),
                        //       Text(
                        //         "${contx.medecines.elementAt(index).category}",
                        //         style: TextStyle(
                        //             fontSize: 14, color: Colors.grey.shade600),
                        //       ),
                        //     ],
                        //   ),

                        //   //  Container(
                        //   //   width: (screenWidth(context) / 2) - 15,
                        //   //   height: 150,
                        //   //   decoration: BoxDecoration(
                        //   //     shape: BoxShape.rectangle,
                        //   //     borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        //   //     image: DecorationImage(
                        //   //       image: NetworkImage(
                        //   //           "${contx.medecines.elementAt(index).image}"),
                        //   //       fit: BoxFit.cover,
                        //   //     ),
                        //   //   ),
                        //   //   child: Padding(
                        //   //     padding: EdgeInsets.all(0),
                        //   //     child: Container(
                        //   //       decoration: BoxDecoration(
                        //   //         shape: BoxShape.rectangle,
                        //   //         borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        //   //         gradient: new LinearGradient(
                        //   //             colors: [
                        //   //               Colors.black,
                        //   //               const Color(0x19000000),
                        //   //             ],
                        //   //             begin: const FractionalOffset(0.0, 1.0),
                        //   //             end: const FractionalOffset(0.0, 0.0),
                        //   //             stops: [0.0, 1.0],
                        //   //             tileMode: TileMode.clamp),
                        //   //       ),
                        //   //       child: Padding(
                        //   //         padding: EdgeInsets.all(10),
                        //   //         child: Column(
                        //   //           crossAxisAlignment: CrossAxisAlignment.start,
                        //   //           mainAxisAlignment: MainAxisAlignment.end,
                        //   //           children: [
                        //   //             Text(
                        //   //               "${contx.medecines.elementAt(index).name}",
                        //   //               style: TextStyle(
                        //   //                   fontSize: 20,
                        //   //                   fontWeight: FontWeight.w500,
                        //   //                   color: Colors.white),
                        //   //             ),
                        //   //             Text(
                        //   //               'Rs. ${contx.medecines.elementAt(index).category}',
                        //   //               style: TextStyle(
                        //   //                   fontSize: 20,
                        //   //                   fontWeight: FontWeight.w200,
                        //   //                   color: Colors.white),
                        //   //             ),
                        //   //           ],
                        //   //         ),
                        //   //       ),
                        //   //     ),
                        //   //   ), /* add child content here */
                        //   // ),
                        // ),
                      );
                    },
                  );
                }
              }),
            ),
          ),
        ],
      ),
      //   GetBuilder<HomeController>(builder: (contx) {
      //   if (contx.medecines.isEmpty) {
      //     return const Center(
      //       child: Text("List Empty",style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),),
      //     );
      //   } else {
      //     return GridView.builder(
      //       physics: BouncingScrollPhysics(),
      //       gridDelegate:
      //           SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      //       itemCount: contx.medecines.length,
      //       padding: EdgeInsets.all(2.0),
      //       itemBuilder: (BuildContext context, int index) {
      //         return
      //         GestureDetector(
      //             onTap: () {
      //               // setState(() {
      //               //   if (_selectedIndex == movie) {
      //               //     _selectedIndex = {};
      //               //   } else {
      //               //     _selectedIndex = movie;
      //               //   }
      //               // });
      //             },
      //             child: Column(
      //               children: [
      //                 Container(
      //                   height: 320,
      //                   margin: EdgeInsets.only(top: 10),
      //                   clipBehavior: Clip.hardEdge,
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(20),
      //                   ),
      //                   child: Image.network("${contx.medecines.elementAt(index).image}", fit: BoxFit.cover),
      //                 ),
      //                 SizedBox(height: 20,),
      //                 Text("${contx.medecines.elementAt(index).name}", style: TextStyle(
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.bold
      //                 ),),
      //                 SizedBox(height: 20,),
      //                 // Text(movie['description'], style: TextStyle(
      //                 //   fontSize: 14,
      //                 //   color: Colors.grey.shade600
      //                 // ),),
      //               ],
      //             ),
      //           );

      //         //  GestureDetector(
      //         //   onTap: () {
      //         //     Get.toNamed('/FoodDetails', arguments: {
      //         //       "0": contx.favorisFood.values.elementAt(index)
      //         //     });
      //         //   },
      //         //   child: Padding(
      //         //     padding: EdgeInsets.all(5),
      //         //     child: Container(
      //         //       width: (screenWidth(context) / 2) - 15,
      //         //       height: 150,
      //         //       decoration: BoxDecoration(
      //         //         shape: BoxShape.rectangle,
      //         //         borderRadius: BorderRadius.all(Radius.circular(15.0)),
      //         //         image: DecorationImage(
      //         //           image: NetworkImage(
      //         //               "${contx.favorisFood.values.elementAt(index).image}"),
      //         //           fit: BoxFit.cover,
      //         //         ),
      //         //       ),
      //         //       child: Padding(
      //         //         padding: EdgeInsets.all(0),
      //         //         child: Container(
      //         //           decoration: BoxDecoration(
      //         //             shape: BoxShape.rectangle,
      //         //             borderRadius: BorderRadius.all(Radius.circular(15.0)),
      //         //             gradient: new LinearGradient(
      //         //                 colors: [
      //         //                   Colors.black,
      //         //                   const Color(0x19000000),
      //         //                 ],
      //         //                 begin: const FractionalOffset(0.0, 1.0),
      //         //                 end: const FractionalOffset(0.0, 0.0),
      //         //                 stops: [0.0, 1.0],
      //         //                 tileMode: TileMode.clamp),
      //         //           ),
      //         //           child: Padding(
      //         //             padding: EdgeInsets.all(10),
      //         //             child: Column(
      //         //               crossAxisAlignment: CrossAxisAlignment.start,
      //         //               mainAxisAlignment: MainAxisAlignment.end,
      //         //               children: [
      //         //                 Text(
      //         //                   "${contx.favorisFood.values.elementAt(index).name}",
      //         //                   style: TextStyle(
      //         //                       fontSize: 20,
      //         //                       fontWeight: FontWeight.w500,
      //         //                       color: Colors.white),
      //         //                 ),
      //         //                 Text(
      //         //                   'Rs. ${contx.favorisFood.values.elementAt(index).price}',
      //         //                   style: TextStyle(
      //         //                       fontSize: 20,
      //         //                       fontWeight: FontWeight.w200,
      //         //                       color: Colors.white),
      //         //                 ),
      //         //               ],
      //         //             ),
      //         //           ),
      //         //         ),
      //         //       ), /* add child content here */
      //         //     ),
      //         //   ),
      //         // );

      //       },
      //     );
      //   }
      // }),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.kPrimary2,
        // foregroundColor: ,
        // mini: true,
        onPressed: () {
          // Respond to button press
          Get.toNamed("/SignIn");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
