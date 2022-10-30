import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/time_booking.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/widgets/afternoon_time.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/widgets/evening_time.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/widgets/morning_timing.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';

class BookController extends GetxController {
  DateTime dateTime = DateTime.now();
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
      Get.find<TimeBooking>().checkTimeBasedOnDate(dateTime);
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

  dateTimeOnChange(DateTime datenow) {
    dateTime = datenow;
    update();
  }


  
}
