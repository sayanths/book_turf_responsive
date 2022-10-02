import 'package:flutter/material.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';

class HeadingsInNavBarScreen extends StatelessWidget {
  final String title;
  const HeadingsInNavBarScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Text(
        title,
        style: Lato(
          cl: white,
          fw: FontWeight.bold,
          sz: 30,
        ),
      ),
    );
  }
}
