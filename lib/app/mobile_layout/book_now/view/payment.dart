import 'dart:developer';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/payement_controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/time_booking.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/custom_appbar.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/full_screen_title.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view_model/view_model_controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/widgets.dart';

class BookNow extends StatelessWidget {
  final Datum data;
  BookNow({
    super.key,
    required this.data,
  });
  final bookContrlNow = Get.find<ViewFullScreen>();
  final payementNow = Get.put(PaymentController());
  final bookTime = Get.put(TimeBooking());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const CustomAppBar(
                mainTitle: 'Select Price', color: white, rating: '', star: ''),
            GetBuilder<ViewFullScreen>(
              builder: (controller) {
                return Column(
                  children: [
                    height20,
                    const FullScreenTitle(title: "Select day", size: 25),
                    height30,
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: SizedBox(
                            child: DatePicker(controller.dateTime,
                                initialSelectedDate: controller.dateTime,
                                selectionColor:
                                    const Color.fromARGB(255, 11, 94, 2),
                                selectedTextColor: Colors.white,
                                onDateChange: (date) {
                              controller.dateTimeOnChange(date);
                            }),
                          ),
                        ),
                        Expanded(
                            child: IconButton(
                          onPressed: () {
                            controller.customDatePicker(context);
                          },
                          icon: const Icon(Icons.date_range_sharp,
                              color: Color.fromARGB(255, 0, 87, 158)),
                        )),
                      ],
                    ),
                    height20,
                    Column(
                      children: [
                        bookContrlNow.customRadio("Morning",
                            data.turfPrice!.morningPrice.toString(), 1),
                        GetBuilder<ViewFullScreen>(builder: (bookContrlNow) {
                          return Wrap(
                            children: List.generate(
                                bookContrlNow.morningSlotes.length, (index) {
                              final item = bookContrlNow.morningSlotes[index];
                              return InkWell(
                                onTap: () {
                                  if (item.canBook) {
                                    item.isSelected == false
                                        ? bookContrlNow
                                            .selectSingleItemMorning(index)
                                        : bookContrlNow
                                            .unselectSingleItemMorning(index: index,item: item);
                                  } else {
                                    Get.snackbar(
                                        "can't select", 'Slot not available',
                                        duration:
                                            const Duration(milliseconds: 1700));
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: item.isSelected == true
                                        ? const Color.fromARGB(255, 0, 0, 0)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(width: 1, color: grey),
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: item.canBook
                                        ? Text(
                                            item.showTime.toString(),
                                            style: const TextStyle(
                                                color: Colors.green),
                                          )
                                        : Text(
                                            item.showTime.toString(),
                                            style: const TextStyle(
                                                color: Colors.red),
                                          ),
                                  ),
                                ),
                              );
                            }),
                          );
                        }),
                        bookContrlNow.customRadio("Afternoon",
                            data.turfPrice!.afternoonPrice.toString(), 1),
                        GetBuilder<ViewFullScreen>(builder: (bookContrlNow) {
                          return Wrap(
                            children: List.generate(
                                bookContrlNow.noonSlotes.length, (index) {
                              final item = bookContrlNow.noonSlotes[index];
                              return InkWell(
                                onTap: () {
                                  if (item.canBook) {
                                    item.isSelected  == false
                                        ? bookContrlNow
                                            .selectSingleItemNoon(index)
                                        : bookContrlNow
                                            .unselectSingleItemNoon(index: index,item: item);
                                  } else {
                                    Get.snackbar(
                                        "can't select", 'Slot not available',
                                        duration:
                                            const Duration(milliseconds: 1700));
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: item.isSelected == true
                                        ? const Color.fromARGB(255, 0, 0, 0)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(width: 1, color: grey),
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: item.canBook
                                        ? Text(
                                            item.showTime.toString(),
                                            style: const TextStyle(
                                                color: Colors.green),
                                          )
                                        : Text(
                                            item.showTime.toString(),
                                            style: const TextStyle(
                                                color: Colors.red),
                                          ),
                                  ),
                                ),
                              );
                            }),
                          );
                        }),
                        bookContrlNow.customRadio("Evening",
                            data.turfPrice!.eveningPrice.toString(), 1),
                        GetBuilder<ViewFullScreen>(builder: (bookContrlNow) {
                          return Wrap(
                            children: List.generate(
                                bookContrlNow.eveningSlotes.length, (index) {
                              final item = bookContrlNow.eveningSlotes[index];
                              return InkWell(
                                onTap: () {
                                  if (item.canBook) {
                                    item.isSelected  == false
                                        ? bookContrlNow
                                            .selectSingleItemEvening(index)
                                        : bookContrlNow
                                            .unselectSingleItemEvening(index: index,item: item);
                                  } else {
                                    Get.snackbar(
                                        "can't select", 'Slot not available',
                                        duration:
                                            const Duration(milliseconds: 1700));
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: item.isSelected == true
                                        ? const Color.fromARGB(255, 0, 0, 0)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(width: 1, color: grey),
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: item.canBook
                                        ? Text(
                                            item.showTime.toString(),
                                            style: const TextStyle(
                                                color: Colors.green),
                                          )
                                        : Text(
                                            item.showTime.toString(),
                                            style: const TextStyle(
                                                color: Colors.red),
                                          ),
                                  ),
                                ),
                              );
                            }),
                          );
                        }),
                      ],
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color.fromARGB(255, 2, 83, 4)),
                  child: const Text("order now"),
                ),
              ),
            ),
          ),
          const Expanded(child: Text("Total amount :-\n 0")),
        ],
      ),
    );
  }
}
