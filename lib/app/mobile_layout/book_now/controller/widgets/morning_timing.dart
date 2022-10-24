import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/widgets/time_booking.dart';
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
              timeBooking.onSelectTiming(index);
            },
            child: GetBuilder<TimeBooking>(builder: (context) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: timeBooking.selectedTime
                          .contains(timeBooking.timeBookedListMorning[index])
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
