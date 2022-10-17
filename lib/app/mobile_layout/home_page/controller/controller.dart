import 'dart:developer';

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
    super.dispose();
    searchController.dispose();
  }

  void addToFavorite(Datum data) async {
    VendorModel response = VendorModel(
      turfUserId: "63469bcad9ce0474dd70083c",
      data: [
        Datum(
          id: data.id,
          turfName: data.turfName,
          turfPlace: data.turfPlace,
          turfCreatorId: data.turfCreatorId,
          turfAmenities: TurfAmenities(
            turfCafeteria: data.turfAmenities!.turfCafeteria,
            turfDressing: data.turfAmenities!.turfDressing,
            turfParking: data.turfAmenities!.turfParking,
            turfGallery: data.turfAmenities!.turfGallery,
            turfWashroom: data.turfAmenities!.turfWashroom,
            turfWater: data.turfAmenities!.turfWater,
          ),
          turfCatogery: TurfCatogery(
            turfBadminton: data.turfCatogery!.turfBadminton,
            turfCricket: data.turfCatogery!.turfCricket,
            turfFootball: data.turfCatogery!.turfFootball,
            turfYoga: data.turfCatogery!.turfYoga,
          ),
          turfImages: TurfImages(
            turfImages1: data.turfImages!.turfImages1,
            turfImages2: data.turfImages!.turfImages2,
            turfImages3: data.turfImages!.turfImages3,
          ),
          turfInfo: TurfInfo(
            turfIsAvailale: data.turfInfo!.turfIsAvailale,
            turfMap: data.turfInfo!.turfMap,
            turfRating: data.turfInfo!.turfRating,
          ),
          turfTime: TurfTime(
            timeAfternoon: data.turfTime!.timeAfternoon,
            timeEvening: data.turfTime!.timeEvening,
            timeMorning: data.turfTime!.timeMorning,
          ),
          turfType: TurfType(
            turfSevens: data.turfType!.turfSevens,
            turfSixes: data.turfType!.turfSixes,
          ),
        ),
      ],
      status: true,
    );
    log("hbvahjbkjhbsjakbjabnjkbkb");
    HomeService().addWishlist(response);
    log("hbvahjbkjhbsjakbjabnjkbkb");
  }
}
