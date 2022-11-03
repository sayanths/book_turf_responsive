import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/widgets/afternoon_time.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/widgets/evening_time.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/widgets/morning_timing.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/model/booking_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/model/time_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/service/booking_service.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';

class ViewFullScreen extends GetxController {
  Datum? dataum;
  @override
  void onInit() {
    super.onInit();
    dataum = Get.arguments as Datum;
    onTimePressed(dataum!);
    getBookingDetailsFromApi();
    checkTime();
    onTimeSlot();
  }

  bool isSelected = true;

  //final bookingControll = Get.put(BookController());

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

  var bookedSlotList = [];
  getBookingDetailsFromApi() async {
    bookedSlotList.clear();
    BookingModel? bookingResult =
        await BookingService().getTurfData(dataum!.id.toString());
    try {
      log("try");
      if (bookingResult != null) {
        if (bookingResult.status!) {
          bookedTimingList.clear();
          log("sd");
          bookedTimingList.addAll(bookingResult.data);
          log(bookedTimingList.length.toString());

          for (var element in bookedTimingList) {
            if (element.timeSlot.isNotEmpty) {
              bookedSlotList.add(element.timeSlot);
            }
          }
          log('timeBookedSlots ${bookedSlotList.toString()}');
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

  List<bookingData> times = [];
  onTimeSlot() {
    times.clear();
    log(bookedTimingList.length.toString());

    for (var element in bookedTimingList) {
      // if (element.timeSlot.isNotEmpty) {
      //   times.add(element);
      // }
      List timeSlot = [];
      timeSlot.add(element.timeSlot.first);
      log(timeSlot.length.toString());
      log("sds");
    }
  }



  onDropDownValueChange() {
    if (dropDownValue == 'Morning') {
      return const MorningTiming();
    } else if (dropDownValue == 'afternoon') {
      return const AfterNoonTiming();
    } else if (dropDownValue == 'evening') {
      return const EveningTiming();
    } else {
      return const MorningTiming();
    }
  }

  // DateTime dateTime = DateTime.now();
  String dropDownSelectedItem = "Morning";
  String? dropDownValue;
  int selected = 0;

  Widget customRadio(String mainTile, String text, int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            mainTile,
            style: const TextStyle(
                color: Color.fromARGB(255, 0, 89, 162),
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: white),
          onPressed: () {
            selected = index;
            update();
          },
          child: Row(
            children: [
              const Text(
                '₹',
                style: TextStyle(
                    color: Color.fromARGB(255, 2, 112, 33),
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              Text(
                text,
                style: const TextStyle(
                    color: Color.fromARGB(255, 3, 201, 10), fontSize: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<String> list = <String>[
    'Morning',
    'afternoon',
    'evening',
  ];

  dropDownValueChange(String value) {
    dropDownSelectedItem = value;
    update();
  }

  customDatePicker(BuildContext context) async {
    final timeSelected = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color.fromARGB(255, 0, 51, 2),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: dateTime,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 60)));
    if (timeSelected != null && timeSelected != dateTime) {
      dateTime = timeSelected;
      Get.find<ViewFullScreen>().checkTimeBasedOnDate(dateTime);
      update();
    }
    update();
  }

  timing(String text, Color color) {
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: grey),
      ),
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(color: color),
      ),
    );
  }

  // onDropDownValueChange() {
  //   if (dropDownValue == 'Morning') {
  //     return const MorningTiming();
  //   } else if (dropDownValue == 'afternoon') {
  //     return const AfterNoonTiming();
  //   } else if (dropDownValue == 'evening') {
  //     return const EveningTiming();
  //   } else {
  //     return const MorningTiming();
  //   }
  // }

  dateTimeOnChange(DateTime datenow) {
    dateTime = datenow;
    update();
  }

}
