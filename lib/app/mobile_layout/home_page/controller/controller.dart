import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/service/get_service.dart';

class HomePageControllerMobile extends GetxController {
  RxBool isFavourite = false.obs;
  List<Datum> vendorTurfList = [];
  List<Datum> topRatedList = [];
  List<Datum> filteredData = [];
  List<Datum> searchResult = [];
  TextEditingController searchController = TextEditingController();
  GlobalKey searchKey = GlobalKey<FormState>();

  fetchDetails() async {
    VendorModel? response = await GetApiService().getTurfData();
    if (response != null) {
      if (response.status!) {
        vendorTurfList.clear();
        vendorTurfList.addAll(response.data);
        topRatedData();
      } else {
        Get.snackbar('no network', '');
      }
    }
    update();
  }

  topRatedData() {
    for (var elements in vendorTurfList) {
      if (elements.turfInfo!.turfRating! >= 4.0 &&
          elements.turfInfo!.turfRating! <= 5.0) {
        topRatedList.add(elements);
      }
    }
    update();
  }

  @override
  void onInit() {
    fetchDetails();
    filteredData = vendorTurfList;
    super.onInit();
  }

  runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      searchResult = vendorTurfList;
    } else {
      searchResult = vendorTurfList
          .where((element) => element.turfName!
              .toUpperCase()
              .contains(enteredKeyword.toUpperCase()))
          .toList();
    }
    filteredData = searchResult;
    update();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
