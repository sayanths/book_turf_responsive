import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/view_all/view/widget/all_category.dart';

class ViewAllMobileController extends GetxController {
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
AllCategory(),
AllCategory(),
AllCategory(),
AllCategory(),
AllCategory(),
  ];
}
