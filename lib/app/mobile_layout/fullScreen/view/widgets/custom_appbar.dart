import 'package:flutter/material.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/full_screen_title.dart';

class CustomAppBar extends StatelessWidget {
  final String star;
  final String mainTitle;
  final Color color;
  final String rating;
  const CustomAppBar(
      {super.key,
      required this.mainTitle,
      required this.color,
      required this.rating, required this.star});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FullScreenTitle(
          title: mainTitle,
          size: 30,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
               Text(star),
              Text(rating),
            ],
          ),
        ),
      ],
    );
  }
}
