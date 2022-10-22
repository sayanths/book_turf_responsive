import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/widgets/time_booking.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/model/booking_model.dart';
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
        children: List.generate(morningtiming.length, (index) {
          return InkWell(
            onTap: () {
              timeBooking.onSelectTiming(index);
              log(timeBooking.selectedTime.toString());
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: grey),
              ),
              padding: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  morningtiming[index].toString(),
                  style: TextStyle(
                      color: timeBooking.selectedTime.contains(index)
                          ? Colors.red
                          : Colors.blue),
                ),
              ),
            ),
          );
        }));
  }
}
