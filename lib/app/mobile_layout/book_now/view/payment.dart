import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/book_now_controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/payement_controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/widgets/time_booking.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/custom_appbar.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/full_screen_title.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/widgets.dart';

class BookNow extends StatelessWidget {
  final Datum data;
  const BookNow({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final bookContrlNow = Get.put(BookController());
    final payementNow = Get.put(PaymentController());
    Get.put(TimeBooking());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const CustomAppBar(
                mainTitle: 'Select Price', color: white, rating: '', star: ''),
            GetBuilder<BookController>(
              builder: (controller) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        bookContrlNow.customRadio("Morning",
                            data.turfPrice!.morningPrice.toString(), 1),
                        bookContrlNow.customRadio("Afternoon",
                            data.turfPrice!.afternoonPrice.toString(), 2),
                        bookContrlNow.customRadio("Evening",
                            data.turfPrice!.eveningPrice.toString(), 3),
                      ],
                    ),
                    height10,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: DropdownButton<String>(
                          value: controller.dropDownSelectedItem,
                          items: controller.list.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            controller.dropDownValueChange(value!);
                            controller.dropDownValue = value;
                          },
                        ),
                      ),
                    ),
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
                            controller.customDatePicker(
                              context,
                            );
                          },
                          icon: const Icon(
                            Icons.date_range_sharp,
                            color: Color.fromARGB(255, 0, 87, 158),
                          ),
                        )),
                      ],
                    ),
                    height20,
                    Wrap(children: [controller.onDropDownValueChange()]),
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
                  onPressed: () {
                    payementNow.option();
                  },
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
