import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/service/get_service.dart';
import 'package:turf_book_second_project/app/mobile_layout/view_all/view/widget/all_category.dart';
import 'package:turf_book_second_project/app/mobile_layout/view_all/view/widget/circket.dart';
import 'package:turf_book_second_project/app/mobile_layout/view_all/view/widget/football_category.dart';
import 'package:turf_book_second_project/app/mobile_layout/view_all/view/widget/yoga.dart';

class ViewAllMobileController extends GetxController {
  List<Datum> cricket = [];
  List<Datum> football = [];
  List<Datum> batminton = [];
  List<Datum> yoga = [];
  List<Datum> allThings = [];
  bool newValue = false;
  int defaultChoicIndex = 0;
  List<String> choiceList = [
    'All',
    'Cricket',
    'Football',
    'Batminton',
    'yoga',
  ];

  choiceChipOnPress(bool value, int index) {
    newValue = value;
    defaultChoicIndex = index;
    update();
  }

  List<Widget> choiceListWidget = [
    GetBuilder<ViewAllMobileController>(
      builder: (controller) {
        final data = controller.allThings[2];
        return AllCategory(data: data);
      },
    ),
    GetBuilder<ViewAllMobileController>(
      builder: (controller) {
        final data = controller.cricket[0];
        return CricketCategory(data: data);
      },
    ),
    GetBuilder<ViewAllMobileController>(
      builder: (controller) {
        final data = controller.football[0];
        return FootBallCategory(data: data);
      },
    ),
    GetBuilder<ViewAllMobileController>(
      builder: (controller) {
        final data = controller.yoga[1];
        return YogaCategory(data: data);
      },
    ),
  ];

  fetchDetails() async {
    TurfHomeModel? response = await GetApiService().getTurfData();
    if (response != null) {
      if (response.status!) {
        allThings.clear();
        allThings.addAll(response.data);
        forCricket();
        forFootBall();
        forBadminton();
        forYoga();
      }
    }
    update();
  }

  forCricket() {
    for (var element in allThings) {
      if (element.turfCategory!.turfCricket == true) {
        cricket.clear();
        cricket.add(element);
      }
    }
    update();
  }

  forFootBall() {
    for (var element in allThings) {
      if (element.turfCategory!.turfFootball == true) {
        football.add(element);
      }
    }
    update();
  }

  forBadminton() {
    for (var element in allThings) {
      if (element.turfCategory!.turfBadminton == true) {
        batminton.add(element);
      }
    }
    update();
  }

  forYoga() {
    for (var element in allThings) {
      if (element.turfCategory!.turfYoga == true) {
        yoga.add(element);
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchDetails();
  }
}
