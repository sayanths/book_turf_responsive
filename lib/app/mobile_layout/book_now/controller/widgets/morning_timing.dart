import 'package:flutter/material.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';

class MorningTiming extends StatelessWidget {
  const MorningTiming({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: grey),
          ),
          padding: const EdgeInsets.all(8),
          child: const Text(
            "10:00 AM",
            style: TextStyle(color: red),
          ),
        ),
      ],
    );
  }
}
