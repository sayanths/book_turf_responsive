import 'dart:developer';

import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';

class TimeBooking extends GetxController {
  @override
  void onInit() {
    super.onInit();
    final dat = Get.arguments as Datum;
    onTimePressed(dat);
  }

  List timeBookedListafterNoon = [];
  List timeBookedListevening = [];
  List timeBookedListMorning = [];
  List selectedTime = [];
  onTimePressed(Datum da) {
    timeBookedListMorning.clear();
    timeBookedListevening.clear();
    timeBookedListafterNoon.clear();
    selectedTime.clear();

    int? moringTimeStarts = da.turfTime!.timeMorningStart;
    int? moringTimeends = da.turfTime!.timeMorningEnd;
    int? afternoonTimeStarts = da.turfTime!.timeAfternoonStart;
    int? afternoonTimeEnds = da.turfTime!.timeAfternoonEnd;
    int? eveningTimeStarts = da.turfTime!.timeEveningStart;
    int? eveningTimeEnds = da.turfTime!.timeEveningEnd;

    for (int i = moringTimeStarts!; i <= moringTimeends!; i++) {
      String timingItem = "$i : 00 - ${i + 1} :00";
      timeBookedListMorning.add(timingItem);
      log(timeBookedListMorning.toString());
      update();
    }

    for (int i = afternoonTimeStarts!; i < afternoonTimeEnds!; i++) {
      String timingItem = "$i : 00 - ${i + 1} :00";
      timeBookedListafterNoon.add(timingItem);
      update();
    }

    for (int i = eveningTimeStarts!; i <= eveningTimeEnds!; i++) {
      String timingItem = "$i : 00 - ${i + 1} :00";
      timeBookedListevening.add(timingItem);
      update();
    }
  }

  onSelectTiming(int index) {
    if (selectedTime.contains(timeBookedListMorning[index].toString())) {
      selectedTime.remove(timeBookedListMorning[index].toString());
    } else {
      selectedTime.add(timeBookedListMorning[index].toString());
      log(selectedTime.toString());
    }
    update();
  }

  onSelectTimingAfterNoon(int index) {
    if (selectedTime.contains(timeBookedListafterNoon[index].toString())) {
      selectedTime.remove(timeBookedListafterNoon[index].toString());
    } else {
      selectedTime.add(timeBookedListafterNoon[index].toString());
      log(selectedTime.toString());
    }
    update();
  }

  onSelectTimingEvening(int index) {
    if (selectedTime.contains(timeBookedListevening[index].toString())) {
      selectedTime.remove(timeBookedListevening[index].toString());
    } else {
      selectedTime.add(timeBookedListevening[index].toString());
      log(selectedTime.toString());
    }
    update();
  }

  // onChek() {
  //   for (var element in selectedTime) {
  //     switch (element) {
  //       case 1:
  //         {
  //           "5:00 -6:00";
  //           "5";
  //           break;
  //         }
  //       case 2:
  //         {
  //           "6:00 -7:00";
  //           "7";
  //           break;
  //         }
  //     }
  //   }
  // }
}
