import 'package:flutter/material.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/model/booking_model.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';



class AfterNoonTiming extends StatelessWidget {
  const AfterNoonTiming({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        direction: Axis.horizontal,
        children: List.generate(afterNoontiming.length, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1, color: grey),
            ),
            padding: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                afterNoontiming[index].toString(),
                style: const TextStyle(color: red),
              ),
            ),
          );
        }));
  }
}