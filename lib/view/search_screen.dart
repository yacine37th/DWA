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
              hintText: 'email'.tr,
              errorMaxLines: 2,
              prefixIcon: Icon(Icons.search, color: AppColors.kLine),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
      body: Center(
        child: Text("deed"),
      ),
    );
  }
}
