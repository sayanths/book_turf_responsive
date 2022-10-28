import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/time_booking.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';

class MorningTiming extends StatelessWidget {
  const MorningTiming({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeBooking = Get.put(TimeBooking());
    return Wrap(
        direction: Axis.horizontal,
        children:
            List.generate(timeBooking.timeBookedListMorning.length, (index) {
          return InkWell(
            onTap: () {
              timeBooking.alreadyList
                      .contains(timeBooking.timeBookedListMorning[index])
                  ? Get.snackbar('Already Booked', "can't book again",
                      colorText: black)
                  : timeBooking.onSelectTiming(index);
            },
            child: GetBuilder<TimeBooking>(builder: (morningList) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: morningList.alreadyList
                          .contains(morningList.timeBookedListMorning[index])
                      ? red
                      : timeBooking.morningBookedTiming.contains(
                              timeBooking.timeBookedListMorning[index])
                          ? black
                          : white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: grey),
                ),
                padding: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    timeBooking.timeBookedListMorning[index].toString(),
                    style: const TextStyle(color: Colors.green),
                  ),
                ),
              );
            }),
          );
        }));
  }
}
