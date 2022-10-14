import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/service/get_service.dart';

class HomePageControllerMobile extends GetxController {
  RxBool isFavourite = false.obs;
  List<Datum> vendorTurfList = [];
  List<Datum> topRatedList = [];
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
    super.onInit();
  }
}
