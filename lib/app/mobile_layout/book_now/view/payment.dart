import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/book_now_controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/view/widgets/custom_app_bar.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/view/widgets/custom_back_button.dart';
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
            const Align(
                alignment: Alignment.topLeft, child: CustomBackButton()),
            height30,
            GetBuilder<BookController>(
              builder: (controller) {
                return Column(
                  children: [
                    const FullScreenTitle(title: "Select Price", size: 25),
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
                    height30,
                    const FullScreenTitle(title: "Select day", size: 25),
                    height10,
                    // ElevatedButton(
                    //   onPressed: () {
                    //     showDatePicker(
                    //         context: context,
                    //         initialDate: DateTime.now(),
                    //         firstDate: DateTime.now(),
                    //         lastDate: DateTime.now());
                    //   },
                    //   child: const Text("Pick Date"),
                    // )
                    Wrap(
                      children: List.generate(4, (index) {
                        Color color =
                            index % 2 == 0 ? Colors.orange : Colors.green;
                        return GestureDetector(
                          onTap: () {
                            
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 1, color: grey),
                            ),
                            padding: const EdgeInsets.all(10),
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
                bookContrlNow.option();
              },
              child: CustomProceedPayBitton(size: size),
            ),
          ],
        ),
      ),
    );
  }
}
