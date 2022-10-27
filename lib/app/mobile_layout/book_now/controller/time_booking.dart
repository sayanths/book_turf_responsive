import 'dart:developer';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/book_now_controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/model/booking_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/model/time_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/service/booking_service.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';

class TimeBooking extends GetxController {
  Datum? dataum;
  @override
  void onInit() {
    super.onInit();
    dataum = Get.arguments as Datum;
    onTimePressed(dataum!);
    getBookingDetails();
    checkTime();
  }

  final bookingControll = Get.put(BookController());

  ///to get the device date of the device
  String yearMonthDateFormat = DateFormat('yMd').format(DateTime.now());

//after iteration will add the vaue to this list
  List timeBookedListafterNoon = [];
  List timeBookedListevening = [];
  List timeBookedListMorning = [];

  //after time booked then will add to this list
  List morningBookedTiming = [];
  List afterNoonBookedTiming = [];
  List nightBookedTiming = [];

  ///--------booked Time from api--------------////
  List<bookingData> bookedTimingList = [];

  // to get the today date
  DateTime dateTime = DateTime.now();
  int dayToday = DateTime.now().day;

  //alreadyList data

  List<String> alreadyList = [];

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

  onSelectTimingEvening(int index, String time) {
    log(backTo24Hour(hour: time).toString());
    if (nightBookedTiming.contains(timeBookedListevening[index].toString())) {
      nightBookedTiming.remove(timeBookedListevening[index].toString());
    } else {
      nightBookedTiming.add(timeBookedListevening[index].toString());
      log(nightBookedTiming.toString());
    }
    update();
  }

  getBookingDetails() async {
    BookingModel? bookingResult =
        await BookingService().getTurfData(dataum!.id.toString());
    try {
      if (bookingResult != null) {
        if (bookingResult.status!) {
          bookedTimingList.clear();
          bookedTimingList.addAll(bookingResult.data);
          log(bookedTimingList.toString());
        }
      }
    } catch (e) {
      Get.snackbar('', e.toString());
    }
    update();
  }

//based on the time check the time from the phone and the time coming from the api to check wheather the time slot is already booked or not
  checkTime() {
    alreadyList.clear();
    int? deviceTime24 =
        int.tryParse(DateFormat.Hm().format(DateTime.now()).split(':').first);
    log(yearMonthDateFormat.toString());
    log(deviceTime24.toString());
    Future.forEach(bookedTimingList, (bookingData element) {
      if (element.bookingDate == yearMonthDateFormat) {
        for (int i = 0; i < element.timeSlot.length; i++) {
          alreadyList.add(convertTo12hr(hour: "$i:00"));
          log(alreadyList.toString());
          log(element.bookingDate.toString());
        }
      }
    });
    for (int i = 0; i <= deviceTime24!; i++) {
      alreadyList.add(convertTo12hr(hour: "$i:00"));
    }
  }

//nalatek okk book cheyan ulla slot open cheyth kodukan days inj anusarich
  checkTimeBasedOnDate(DateTime date) {
    if (date != dateTime) {
      if (dayToday != date.day) {
        alreadyList.clear();
        morningBookedTiming.clear();
        afterNoonBookedTiming.clear();
        nightBookedTiming.clear();

        update();
      } else {
        checkTime();
        update();
      }
    }
  }
}
