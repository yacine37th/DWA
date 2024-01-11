import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 0;
  @override
  RouteSettings? redirect(String? route) {
    if (currentUser != null && currentUser!.emailVerified) {
      //  MainFunctions.getcurrentUserInfos();
      // MainFunctions.loadTripsDriversData();
      return const RouteSettings(name: "/AddMedecine");
    } else {
      return null;
    }
  }
}
