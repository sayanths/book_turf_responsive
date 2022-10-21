import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/widgets/afternoon_time.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/widgets/evening_time.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/widgets/morning_timing.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';

class BookController extends GetxController {
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
        OutlinedButton(
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
                style: TextStyle(
                    color: (selected == index)
                        ? const Color.fromARGB(255, 3, 201, 10)
                        : const Color.fromARGB(255, 148, 147, 147),
                    fontSize: 20),
              ),
            ],
          ),
        ),
      ],
    );
    
  }

  datePicking() {
    DatePicker(DateTime.now(),
        initialSelectedDate: DateTime.now(),
        selectionColor: const Color.fromARGB(255, 11, 94, 2),
        selectedTextColor: Colors.white, onDateChange: (date) {
      // bottomSheetWidget();
      update();
    });
  }

  bottomSheetWidget() {
    BottomSheet(
      onClosing: () {},
      builder: (context) {
        return const SizedBox();
      },
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

  customDatePicker(BuildContext context) {
    showDatePicker(
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
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
  }

  List<Widget> time = [
    // timing('100', red),
  ];

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
}
