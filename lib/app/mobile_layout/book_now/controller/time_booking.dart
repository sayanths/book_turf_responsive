import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/model/time_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';

class TimeBooking extends GetxController {
  @override
  void onInit() {
    super.onInit();
    final dat = Get.arguments as Datum;
    onTimePressed(dat);
  }

  //final hour = DateTime.now().hour;
   DateTime now = DateTime.now();
 //String hourFormat = DateFormat.Hm().format(now);

//after iteration will add the vaue to this list
  List timeBookedListafterNoon = [];
  List timeBookedListevening = [];
  List timeBookedListMorning = [];

  //after time booked then will add to this list
  List morningBookedTiming = [];
  List afterNoonBookedTiming = [];
  List nightBookedTiming = [];

  //already booked time lis
  List morningAlreadyBooked = [];
  List evenigAlreadyBooked = [];
  List afterNoonAlreadyBooked = [];

  ///----------------------////

  onTimePressed(Datum da) {
    timeBookedListMorning.clear();
    timeBookedListevening.clear();
    timeBookedListafterNoon.clear();
    morningBookedTiming.clear();
    afterNoonBookedTiming.clear();
    nightBookedTiming.clear();

    int? moringTimeStarts = da.turfTime!.timeMorningStart;
    int? moringTimeends = da.turfTime!.timeMorningEnd;
    int? afternoonTimeStarts = da.turfTime!.timeAfternoonStart;
    int? afternoonTimeEnds = da.turfTime!.timeAfternoonEnd;
    int? eveningTimeStarts = da.turfTime!.timeEveningStart;
    int? eveningTimeEnds = da.turfTime!.timeEveningEnd;

    //iterating the values using for loop to get the //
    for (int i = moringTimeStarts!; i <= moringTimeends!; i++) {
      timeBookedListMorning.add(convertTo12hr(hour: "$i:00"));
      log(timeBookedListMorning.toString());
      update();
    }

    for (int i = afternoonTimeStarts!; i < afternoonTimeEnds!; i++) {
      timeBookedListafterNoon.add(convertTo12hr(hour: "$i:00"));
      update();
    }

    for (int i = eveningTimeStarts!; i <= eveningTimeEnds!; i++) {
      timeBookedListevening.add(convertTo12hr(hour: "$i:00"));
      update();
    }
  }

  //container color is changeing and adding to another list if we select the time
  onSelectTiming(int index) {
    if (morningBookedTiming.contains(timeBookedListMorning[index].toString())) {
      morningBookedTiming.remove(timeBookedListMorning[index].toString());
    } else {
      morningBookedTiming.add(timeBookedListMorning[index].toString());
      log(morningBookedTiming.toString());
    }
    update();
  }

  onSelectTimingAfterNoon(int index, String time) {
    log(backTo24Hour(hour: time).toString());
    if (afterNoonBookedTiming
        .contains(timeBookedListafterNoon[index].toString())) {
      afterNoonBookedTiming.remove(timeBookedListafterNoon[index].toString());
    } else {
      afterNoonBookedTiming.add(timeBookedListafterNoon[index].toString());
      log(afterNoonBookedTiming.toString());
    }
    update();
  }

  onSelectTimingEvening(int index,String time) {
    log(backTo24Hour(hour: time).toString());
    if (nightBookedTiming.contains(timeBookedListevening[index].toString())) {
      nightBookedTiming.remove(timeBookedListevening[index].toString());
    } else {
      nightBookedTiming.add(timeBookedListevening[index].toString());
      log(nightBookedTiming.toString());
    }
    update();
  }

  //converting the railway time to normal time
  alreadyBooked() {
    morningAlreadyBooked.clear();
    afterNoonAlreadyBooked.clear();
    evenigAlreadyBooked.clear();
    // if (hourFormat > 12) {}
  }
}
