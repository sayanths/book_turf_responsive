import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const Iconify(
            Carbon.location_current,
            color: black,
          ),
          Text(
            "calicut,Kerala,India",
            style: Lato(cl: black),
          ),
        ],
      ),
    );
  }
}
