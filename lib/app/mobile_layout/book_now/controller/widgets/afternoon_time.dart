import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/widgets/time_booking.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';

class AfterNoonTiming extends StatelessWidget {
  const AfterNoonTiming({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeBookingAfterNoon = Get.put(TimeBooking());
    return Wrap(
        direction: Axis.horizontal,
        children: List.generate(
            timeBookingAfterNoon.timeBookedListafterNoon.length, (index) {
          return InkWell(
            onTap: () {
              timeBookingAfterNoon.onSelectTimingAfterNoon(
                index,
              );
            },
            child: GetBuilder<TimeBooking>(builder: (context) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: context.selectedTime
                          .contains(context.timeBookedListafterNoon[index])
                      ? black
                      : white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: grey),
                ),
                padding: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    context.timeBookedListafterNoon[index].toString(),
                    style: const TextStyle(color: Colors.green),
                  ),
                ),
              );
            }),
          );
        }
        )
        );
  }
}
