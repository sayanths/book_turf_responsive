import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/book_now_controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/view/widgets/custom_app_bar.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/view/widgets/custom_back_button.dart';
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            height20,
            const CustomAppBar(
                mainTitle: "Select Price", color: white, rating: '', star: ''),
            GetBuilder<BookController>(
              builder: (controller) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        controller.customRadio("Morning",
                            data.turfTime!.timeMorning.toString(), 1),
                        controller.customRadio("Afternoon",
                            data.turfTime!.timeAfternoon.toString(), 2),
                        controller.customRadio("Evening",
                            data.turfTime!.timeEvening.toString(), 3),
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
                            child: DatePicker(DateTime.now(),
                                initialSelectedDate: DateTime.now(),
                                selectionColor:
                                    const Color.fromARGB(255, 11, 94, 2),
                                selectedTextColor: Colors.white,
                                onDateChange: (date) {}),
                          ),
                        ),
                        Expanded(
                            child: IconButton(
                          onPressed: () {
                            controller.customDatePicker(context);
                          },
                          icon: const Icon(
                            Icons.date_range_sharp,
                            color: Color.fromARGB(255, 0, 87, 158),
                          ),
                        )),
                      ],
                    ),
                    height20,
                    Wrap(
                      children: List.generate(4, (index) {
                        Color color =
                            index % 2 == 0 ? Colors.orange : Colors.green;
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 1, color: grey),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "10:00 AM",
                              style: TextStyle(color: color),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        size: size,
        child: Column(
          children: [
            height10,
            height10,
            InkWell(
              onTap: () {
                bookContrlNow.addBooking();
                //  bookContrlNow.option();
              },
              child: CustomProceedPayBitton(size: size),
            ),
          ],
        ),
      ),
    );
  }
}
