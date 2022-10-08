import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';

class AmenitiesWidget extends StatelessWidget {
  final Iconify iconify;
  final String title;
  const AmenitiesWidget({
    Key? key,
    required this.size, required this.iconify, required this.title,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      height: size.height / 15,
      width: size.width / 2.5,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 193, 225, 251),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          iconify,
          Text(
            title,
            style: Lato(fw: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
