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
}
