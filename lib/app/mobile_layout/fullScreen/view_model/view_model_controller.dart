import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/payement_controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/model/booking_addpost_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/model/booking_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/model/time_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/service/booking_service.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/model/slot_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';

class ViewFullScreen extends GetxController {
  Datum? dataum;
  @override
  void onInit() async {
    super.onInit();
    dataum = Get.arguments as Datum;
    onTimePressed(dataum!);
    timeListCreation();
    await getBookingDetailsFromApi();
    convertToMap(DateTime.now());
  }

  @override
  void onClose() {
    bookingList.clear();
    super.onClose();
  }

  ///--------booked Time from api--------------////
  List<bookingData> bookedTimingList = [];

  // to get the today date
  DateTime dateTime = DateTime.now();
  int dayToday = DateTime.now().day;

  //alreadyList data

  // List<String> alreadyList = [];
  late int? moringTimeStarts;
  late int? moringTimeends;
  late int? afternoonTimeStarts;
  late int? afternoonTimeEnds;
  late int? eveningTimeStarts;
  late int? eveningTimeEnds;
  late String turfId;
  onTimePressed(Datum da) {
    moringTimeStarts = da.turfTime!.timeMorningStart;
    moringTimeends = da.turfTime!.timeMorningEnd;
    afternoonTimeStarts = da.turfTime!.timeAfternoonStart;
    afternoonTimeEnds = da.turfTime!.timeAfternoonEnd;
    eveningTimeStarts = da.turfTime!.timeEveningStart;
    eveningTimeEnds = da.turfTime!.timeEveningEnd;
    turfId = da.id!;
  }

  var bookedSlotList = [];
  Map<String, dynamic> timeSlotesMap = {};
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
          log("allApiList ${bookedTimingList.toString()}");
          await Future.forEach(bookedTimingList, (bookingData element) {
            timeSlotesMap["${element.bookingDate}"] = element.timeSlot;
          });
          print("Maped Slotes Are");
          print(timeSlotesMap);
        }
      }
    } catch (e) {
      Get.snackbar('', e.toString());
    }
    update();
  }

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///
  List<int> selectedDateBookedList = [];
  int todayHour = DateTime.now().hour;
  String todayDate = DateFormat('yMd').format(DateTime.now());
  late String selectedDate;
  convertToMap(DateTime date) {
    selectedDate = DateFormat('yMd').format(date);
    selectedDateBookedList.clear();
    if (selectedDate != todayDate) {
      todayHour = 0;
    } else {
      todayHour = DateTime.now().hour;
    }
    print(selectedDate);
    final result = timeSlotesMap.containsKey(selectedDate);
    //  print('contains--->$result');
    if (result) {
      selectedDateBookedList = timeSlotesMap[selectedDate];
      print("selectedDateBookedList--> $selectedDateBookedList");
    }
    createList();
  }

  List<int> morningTimeList = [];
  List<int> noonTimeList = [];
  List<int> eveningTimeList = [];

  timeListCreation() {
    morningTimeList.clear();
    noonTimeList.clear();
    eveningTimeList.clear();
    for (int i = moringTimeStarts!; i <= moringTimeends!; i++) {
      morningTimeList.add(i);
    }
    for (int i = afternoonTimeStarts!; i <= afternoonTimeEnds!; i++) {
      noonTimeList.add(i);
    }
    for (int i = eveningTimeStarts! + 1; i <= eveningTimeEnds!; i++) {
      eveningTimeList.add(i);
    }
  }

  List<SlotModel> morningSlotes = [];
  List<SlotModel> noonSlotes = [];
  List<SlotModel> eveningSlotes = [];

  createList() {
    morningSlotes.clear();
    noonSlotes.clear();
    eveningSlotes.clear();
    print("today hour--->$todayHour");
    morningSlotes = morningTimeList
        .map((e) => SlotModel(
            time: e,
            canBook: true,
            showTime: convertTo12hr(hour: "$e:00"),
            price: dataum!.turfPrice!.morningPrice!.toInt(),
            isSelected: false))
        .toList();
    recheckBocked(morningSlotes);

    noonSlotes = noonTimeList
        .map((e) => SlotModel(
            time: e,
            canBook: true,
            showTime: convertTo12hr(hour: "$e:00"),
            price: dataum!.turfPrice!.afternoonPrice!.toInt(),
            isSelected: false))
        .toList();
    recheckBocked(noonSlotes);
    eveningSlotes = eveningTimeList
        .map((e) => SlotModel(
            time: e,
            canBook: true,
            showTime: convertTo12hr(hour: "$e:00"),
            price: dataum!.turfPrice!.eveningPrice!.toInt(),
            isSelected: false))
        .toList();
    recheckBocked(eveningSlotes);
    update();
  }

  recheckBocked(List<SlotModel> list) {
    for (var element in list) {
      if (element.time <= todayHour) {
        element.canBook = false;
        element.isSelected = false;
      } else if (selectedDateBookedList.contains(element.time)) {
        element.canBook = false;
        element.isSelected = false;
      }
    }
    for (var e in list) {
      print("${e.time}------->${e.canBook}");
    }
  }

  selectSingleItemMorning(int index) {
    morningSlotes[index].isSelected = true;
    update();
    addToAmountList(morningSlotes[index].price, morningSlotes[index].time);
  }

  unselectSingleItemMorning({required int index, required SlotModel item}) {
    morningSlotes[index].isSelected = false;
    update();
    removeFromAmountList(item);
  }

  selectSingleItemNoon(int index) {
    noonSlotes[index].isSelected = true;
    update();
    addToAmountList(noonSlotes[index].price, noonSlotes[index].time);
  }

  unselectSingleItemNoon({required int index, required SlotModel item}) {
    noonSlotes[index].isSelected = false;
    update();
    removeFromAmountList(item);
  }

  selectSingleItemEvening(int index) {
    eveningSlotes[index].isSelected = true;
    update();
    addToAmountList(eveningSlotes[index].price, eveningSlotes[index].time);
  }

  unselectSingleItemEvening({required int index, required SlotModel item}) {
    eveningSlotes[index].isSelected = false;
    update();
    removeFromAmountList(item);
  }

  List<int> bookingList = [];
  RxInt totalAmount = 0.obs;

  addToAmountList(int amount, int time) {
    totalAmount.value = totalAmount.value + amount;

    bookingList.add(time);
    print(bookingList);
  }

  removeFromAmountList(SlotModel item) {
    int index = bookingList.indexWhere((element) => element == item.time);
    if (index != -1) {
      bookingList.removeAt(index);
    }
    print(bookingList);
    totalAmount.value = totalAmount.value - item.price;
  }

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
      Get.find<ViewFullScreen>().convertToMap(dateTime);
    }
    update();
  }

  dateTimeOnChange(DateTime datenow) {
    dateTime = datenow;
    update();
  }

  paymentInitialize() {
    final PaymentController controller = Get.put(PaymentController());
    final obj = BookingPostModel(
        bookingDate: selectedDate, timeSlot: bookingList, turfId: turfId);
    controller.option(obj);
  }
}
