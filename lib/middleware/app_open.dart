import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';


class AppIsOppen extends GetMiddleware {
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (sharedPreferences!.getString("appIsOppen")!=null) {
      //  MainFunctions.getcurrentUserInfos();
      // MainFunctions.loadTripsDriversData();
      return const RouteSettings(name: "/SignIn" , arguments: "home");
    } else {
      return null;
    }
  }
}
