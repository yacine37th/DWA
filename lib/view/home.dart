import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

import '../theme/main_colors.dart';
import 'widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Text("enterSMS".tr),
      ),
    );
  }
}
