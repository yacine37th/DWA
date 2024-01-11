import 'package:dwa/view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../controller/home_controller.dart';
import '../controller/home_screen_controller.dart';
import '../main.dart';
import '../theme/colors.dart';
import '../theme/main_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<BottomNavigationBarItem> bottomNavigationBarItemList = [
  //   const BottomNavigationBarItem(
  //     label: "الرئيسية",
  //     icon: Icon(Icons.home),
  //     // activeIcon: ActiveBottomBarIcon(
  //     //   widgetIcon: ImageIcon(Svg("assets/icons/home_icon.svg")),
  //     // ),
  //   ),
  //   const BottomNavigationBarItem(
  //     label: "الرئيسية",
  //     icon: Icon(Icons.home),
  //     // activeIcon: ActiveBottomBarIcon(
  //     //   widgetIcon: ImageIcon(Svg("assets/icons/home_icon.svg")),
  //     // ),
  //   ),
  //   const BottomNavigationBarItem(
  //     label: "الرئيسية",
  //     icon: Icon(Icons.home),
  //     // activeIcon: ActiveBottomBarIcon(
  //     //   widgetIcon: ImageIcon(Svg("assets/icons/home_icon.svg")),
  //     // ),
  //   ),
  //   const BottomNavigationBarItem(
  //     label: "الرئيسية",
  //     icon: Icon(Icons.home),
  //     // activeIcon: ActiveBottomBarIcon(
  //     //   widgetIcon: ImageIcon(Svg("assets/icons/home_icon.svg")),
  //     // ),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.find();
    HomeController homeController = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 28, 28, 28),
        child: Column(children: [
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 20, 5, 5),
            child: Row(children: [
              Container(
                width: 50,
                height: 50,
                child: ProfilePicture(),
              ),
              const SizedBox(width: 5),
              Text(
                "${currentUserInfos.name!} ",
                style: TextStyle(color: Colors.white),
              ),
            ]),
          ),
          const Divider(
            color: Colors.white,
          ),
          // TextButton.icon(
          //   style: ButtonStyle(
          //       iconSize: MaterialStateProperty.all(25),
          //       padding:
          //           MaterialStateProperty.all(const EdgeInsets.only(left: 25)),
          //       shape: MaterialStateProperty.all(RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(0))),
          //       alignment: Alignment.centerLeft,
          //       backgroundColor:
          //           MaterialStateProperty.all(AppColors.transparentColor),
          //       foregroundColor: MaterialStateProperty.all(
          //           Theme.of(context).primaryColorLight)),
          //   onPressed: () {
          //     Get.defaultDialog(
          //         title: "Settings".tr,
          //         content: Column(
          //           children: [
          //             // TextButton.icon(
          //             //     onPressed: () {
          //             //       Get.back();
          //             //       homeScreenController.setDarkTheme();
          //             //     },
          //             //     icon: Get.isDarkMode
          //             //         ? const Icon(Icons.dark_mode, size: 30)
          //             //         : const Icon(Icons.light_mode, size: 30),
          //             //     label: Text("theme".tr)),
          //             // const SizedBox(
          //             //   height: 10,
          //             // ),
          //             TextButton.icon(
          //                 onPressed: () {
          //                   Get.back();
          //                   homeScreenController.setLanguage();
          //                 },
          //                 icon: const ImageIcon(
          //                     Svg("assets/icons/language_icon.svg"),
          //                     size: 30),
          //                 label: Text("language".tr)),
          //           ],
          //         ));
          //   },
          //   icon: const ImageIcon(Svg("assets/icons/setting_icon.svg")),
          //   label: GetBuilder<HomeScreenController>(builder: (context) {
          //     return Text(
          //       'Settings'.tr,
          //       style:
          //           const TextStyle(fontSize: 19, fontWeight: FontWeight.w300),
          //     );
          //   }),
          // ),

          ListTile(
            tileColor: AppColors.transparentColor,
            textColor: AppColors.whiteColor,
            iconColor: AppColors.whiteColor,
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            horizontalTitleGap: 1,
            dense: true,
            title: Text(
              "language".tr,
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Cairo'),
            ),
            leading: const Icon(Icons.language),
            onTap: () {
              homeScreenController.setLanguage();

              // Get.defaultDialog(
              //     title: "Languages".tr,
              //     content: ElevatedButton(onPressed: (){
              //           homeScreenController.setLanguage();
              //     }, child: Text('"dded')));

              // homeController.signOutOfAnExistingAccount();
            },
          ),
          SizedBox(
            height: 15,
          ),

          ListTile(
            tileColor: AppColors.transparentColor,
            textColor: AppColors.whiteColor,
            iconColor: AppColors.whiteColor,
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            horizontalTitleGap: 1,
            dense: true,
            title: Text(
              "signOut".tr,
              style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Cairo'),
            ),
            leading: const Icon(Icons.logout),
            onTap: () {
              homeController.signOutOfAnExistingAccount();
            },
          ),
          const Spacer(),
        ]),
      ),

      // appBar: AppBar(),
      // drawer: Drawer(),
      backgroundColor: Colors.white,

      body: GetBuilder<HomeScreenController>(builder: (context) {
        return homeScreenController.bottomNavigationBarScreensList[
            homeScreenController.currentBottomBarIndex()];
      }),
      // bottomNavigationBar: GetBuilder<HomeScreenController>(builder: (context) {
      //   return BottomNavigationBar(
      //     selectedLabelStyle: TextStyle(fontFamily: 'Cairo', color: blackColor),
      //     unselectedLabelStyle: TextStyle(fontFamily: 'Cairo'),
      //     selectedItemColor: orangeColor,
      //     unselectedItemColor: greyColor,
      //     items: bottomNavigationBarItemList,
      //     type: BottomNavigationBarType.shifting,
      //     showSelectedLabels: true,
      //     showUnselectedLabels: true,
      //     selectedIconTheme: IconThemeData(color: whiteColor),
      //     elevation: 0,
      //     currentIndex: homeScreenController.currentBottomBarIndex(),
      //     onTap: (index) {
      //       homeScreenController.switchBetweenScreens(index);
      //     },
      //   );
      // }),

      // body: Center(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      bottomNavigationBar: GetBuilder<HomeScreenController>(
        builder: (contx) => Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.02),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: AppColors.kPrimary2,
                hoverColor: AppColors.kPrimary2,
                gap: 10,
                activeColor: AppColors.whiteColor,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: const Color.fromRGBO(132, 189, 147, 1),
                color: AppColors.kSecondary,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    iconActiveColor: Colors.white,
                    // iconColor: Colors.red,
                    active: true,
                    text: 'Home'.tr,
                  ),
                  // GButton(
                  //   icon: LineIcons.heart,
                  //   text: 'Likes',
                  // ),
                  GButton(
                    icon: LineIcons.penFancy,
                    text: 'Posts',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profil',
                  ),
                ],
                selectedIndex: homeScreenController.currentBottomBarIndex(),
                onTabChange: (index) {
                  homeScreenController.switchBetweenScreens(index);
                  // setState(() {
                  //   _selectedIndex = index;
                  // });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
