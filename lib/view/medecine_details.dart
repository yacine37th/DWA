import 'package:dwa/view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/medecine_details_controller.dart';
import '../theme/main_colors.dart';

class MedecineDetails extends StatelessWidget {
  const MedecineDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    MedecineDetailsController medecineDetailsController = Get.find();
    return Scaffold(
       appBar: AppBar(
        //   bottom: PreferredSize(
        // preferredSize: Size(0, 0),
        // child: Container(
        //   color: AppColors.kPrimary2,
        //   height: 1,
        // )),
        title: Text("${medecineDetailsController.medecine.name}" , style:const TextStyle(color: AppColors.kPrimary2),),
        backgroundColor: AppColors.transparentColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              navigator!.pop();
            },
            icon:const Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.kPrimary2,
            )),
              bottom: PreferredSize(
            preferredSize: Size(0, 0),
            child: Container(
              color: AppColors.kPrimary2,
              height: 1,
            )),

      ),
     
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
          child: ListView(physics: BouncingScrollPhysics(), children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  MedecinePicture(
                      foodPicUrl:
                          "${medecineDetailsController.medecine.image}"), //url
                  Container(  
                    // margin: EdgeInsets.only(top: screenHeight * 0.32),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      // border: Border(
                      //   top: BorderSide(color: AppColors.kPrimary2)
                      // ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                      // boxShadow: [
                      // BoxShadow(
                      //     color: Colors.black54,
                      //     blurRadius: 10,
                      //     offset: Offset(0, -0.1)
                      //     )
                      // ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Container(
                            width: screenWidth / 3.43,
                            height: screenHeight / 227.67,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black12),
                          ),
                          SizedBox(
                            height: screenHeight / 34.15,
                          ),
                          FoodName(
                            foodName:
                                '${medecineDetailsController.medecine.name}',
                            cate:
                                '${medecineDetailsController.medecine.category}',
                            date:
                                "${medecineDetailsController.medecine.expiredDate}",
                            // foodPrice: medecineDetailsController.medecine.price,
                          ),
                          // Stars(),
                          FoodDescription(
                            about:
                                "${medecineDetailsController.medecine.description}",
                          ),
                          // FeaturesFood(),
                          // IncreaseDecrease(food: widget.food),
                          // Padding(
                          //   padding: EdgeInsets.only(top: screenHeight / 45.54),
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Padding(
                          //         padding: EdgeInsets.only(
                          //             top: screenHeight / 68.3,
                          //             bottom: screenHeight / 34.15),
                          //         child: const MySeparator(
                          //           color: Colors.grey,
                          //         ),
                          //       ),
                          //       Text(
                          //         "Total",
                          //         style: TextStyle(
                          //             color: Colors.black54,
                          //             fontSize: screenHeight / 42.69),
                          //       ),

                          //       /// 16
                          //       Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         crossAxisAlignment: CrossAxisAlignment.center,
                          //         children: [
                          //           Column(
                          //             mainAxisAlignment: MainAxisAlignment.center,
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             children: [
                          //               GetBuilder<medecineDetailsController>(
                          //                 builder: (contx) => Text(
                          //                   "\$${int.parse("${contx.singleFood.price}") * contx.counter}",
                          //                   style: TextStyle(
                          //                       color: Colors.black,
                          //                       fontSize: screenHeight / 27.32),
                          //                 ),
                          //               )
                          //             ],
                          //           ),
                          //           Container(
                          //             child: Row(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.center,
                          //               children: [
                          //                 InkWell(
                          //                   onTap: () {
                          //                     medecineDetailsController
                          //                         .decreaseCart();
                          //                   },
                          //                   child: Container(
                          //                     height: screenHeight / 13.94,
                          //                     width: screenWidth / 8.39,
                          //                     decoration: BoxDecoration(
                          //                       border: Border.all(
                          //                           color: AppColors.kBackground,
                          //                           width: 1),
                          //                       borderRadius:
                          //                           BorderRadius.circular(15),
                          //                       color: AppColors.kPrimary,
                          //                     ),
                          //                     child: Center(
                          //                       child: Icon(Icons.remove,
                          //                           color: AppColors.whiteColor),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 Container(
                          //                   width: screenWidth / 6.85,
                          //                   height: screenHeight / 13.94,
                          //                   child: Center(
                          //                     child: GetBuilder<
                          //                         medecineDetailsController>(
                          //                       builder: (contx) => Text(
                          //                         "${contx.counter}",
                          //                         style: TextStyle(
                          //                             fontSize:
                          //                                 screenHeight / 37.95,
                          //                             fontWeight:
                          //                                 FontWeight.bold),
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 InkWell(
                          //                   onTap: () {
                          //                     // _increaseCart();
                          //                     medecineDetailsController
                          //                         .increaseCart();
                          //                   },
                          //                   child: Container(
                          //                     height: screenHeight / 13.94,
                          //                     width: screenWidth / 8.39,
                          //                     decoration: BoxDecoration(
                          //                       border: Border.all(
                          //                           color: AppColors.kBackground,
                          //                           width: 1),
                          //                       borderRadius:
                          //                           BorderRadius.circular(15),
                          //                       color: AppColors.kPrimary,
                          //                     ),
                          //                     child: Center(
                          //                       child: Icon(Icons.add,
                          //                           color: AppColors.whiteColor),
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),

                          // AddToCartButton(),
                          // Padding(
                          //   padding: EdgeInsets.fromLTRB(
                          //     screenWidth / 20.55,
                          //     screenHeight / 34.15,
                          //     screenWidth / 20.55,
                          //     0,
                          //   ),
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       color: AppColors.kPrimary,
                          //       borderRadius: BorderRadius.circular(20),
                          //     ),
                          //     child: ElevatedButton(
                          //       style: ButtonStyle(
                          //         shape: MaterialStateProperty.all<
                          //             RoundedRectangleBorder>(
                          //           RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.circular(20.0),
                          //           ),
                          //         ),
                          //         minimumSize: MaterialStateProperty.all(Size(
                          //             screenWidth / 1.37, screenHeight / 11.66)),
                          //         backgroundColor: MaterialStateProperty.all(
                          //             AppColors.kPrimary2),
                          //         // shadowColor: MaterialStateProperty.all(
                          //         //     Colors.transparent),
                          //       ),
                          //       onPressed: () {
                          //         // medecineDetailsController.addToCart(
                          //         //     '${medecineDetailsController.singleFood.uID}',
                          //         //     medecineDetailsController.singleFood);
                          //       },
                          //       child: Wrap(
                          //         children: [
                          //           Padding(
                          //             padding: EdgeInsets.only(
                          //                 right: screenWidth / 51.38),
                          //             child: Icon(
                          //               Icons.shopping_cart_rounded,
                          //               color: Colors.white,
                          //             ),
                          //           ),
                          //           Text(
                          //             "Add to Cart",
                          //             style: TextStyle(
                          //               fontSize: screenHeight / 34.15,
                          //               fontWeight: FontWeight.w700,
                          //               color: Colors.white,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  // DetailWidget(
                  //   food: widget.food,
                  // ),
                ],
              ),
            ),
          ]),
        ),
        bottomNavigationBar: GetBuilder<MedecineDetailsController>(
          builder: (contx) => Container(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight / 15.0,
              horizontal: screenHeight / 30.0,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: TextButton(
              onPressed: () {
                medecineDetailsController.launchPhoneDialer(
                    "${medecineDetailsController.medecine.phone}");
              },
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    AppColors.kPrimary2,
                  ),
                  // backgroundColor: MaterialStateProperty.all(
                  //   AppColors.kPrimary2,
                  // ),
                  // textStyle: MaterialStatePropertyAll(),
                  textStyle: MaterialStateProperty.resolveWith((states) {
                    Color textColor = states.contains(MaterialState.disabled)
                        ? AppColors.kPrimary2
                        : AppColors.kLine;
                    return TextStyle(fontSize: 18, color: textColor);
                  }),
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.kPrimary2.withOpacity(0.2)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
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
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone,
                          color: AppColors.kPrimary2,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Contacter".tr,
                          style: const TextStyle(
                              color: AppColors.kPrimary2,
                              fontSize: 19,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ));
  }
}
