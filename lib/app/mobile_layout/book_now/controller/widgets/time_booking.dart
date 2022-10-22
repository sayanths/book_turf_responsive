import 'dart:developer';

import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';

class TimeBooking extends GetxController {
  @override
  void onInit() {
    onTimePressed();
    super.onInit();
  }

  final data = Datum();
  List<String> selectedTime = [];

  onTimePressed() {
    int? moringTimeStarts = data.turfTime!.timeMorningStart;
    int? moringTimeends = data.turfTime!.timeMorningStart;
    int? afternoonTimeStarts = data.turfTime!.timeAfternoonStart;
    int? afternoonTimeEnds = data.turfTime!.timeMorningStart;
    int? eveningTimeStarts = data.turfTime!.timeEveningStart;
    int? eveningTimeEnds = data.turfTime!.timeMorningStart;
    timeBookedListMorning.clear();

    for (int i = moringTimeStarts!; i <= moringTimeends!; i++) {
      String timingItem = "$i : 00 - ${i + 1} :00";
      log(timingItem.toString());
      timeBookedListMorning.add(timingItem);
      log(timeBookedListMorning.length.toString());
    }
    update();
  }

  var timeBookedListMorning = [];
  List timeBookedListafterNoon = [];
  List timeBookedListevening = [];

  List morningtiming = [
    '6:00  -  7:00',
    '7:00  -  8:00',
    '8:00  -  9:00',
    '9:00  -  10:00',
    '10:00 -  11:00',
    '11:00 -  12:00',
  ];

  List afterNoontiming = [
    '1:00  -  2:00',
    '2:00  -  3:00',
    '3:00  -  4:00',
    '4:00  -  6:00',
  ];

  List eveningtiming = [
    '7:00  -  8:00',
    '8:00  -  9:00',
    '9:00  -  10:00',
    '10:00 -  11:00',
    '11:00 -  12:00',
    '1:00  -  2:00',
    '2:00  -  3:00',
  ];

  onSelectTiming(int index) {
    if (selectedTime.contains(morningtiming[index].toString())) {
      selectedTime.remove(morningtiming[index].toString());
    } else {
      selectedTime.add(morningtiming[index].toString());
    }
    update();
  }
}