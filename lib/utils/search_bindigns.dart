import 'package:dwa/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SearchControllerr());
  }
  
}