import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/full_screen_title.dart';

import '../../view_model/view_model_controller.dart';

class CustomAppBar extends StatelessWidget {
  final String star;
  final String mainTitle;
  final Color color;
  final String rating;
  final bool isBookScreen;
  const CustomAppBar(
      {super.key,
      required this.mainTitle,
      required this.color,
      required this.rating,
      required this.star,
      this.isBookScreen = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              if (isBookScreen) {
                final controller = Get.find<ViewFullScreen>();
                controller.bookingList.clear();
                log('bookinglistcleard');
              }
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        FullScreenTitle(
          title: mainTitle,
          size: 20,
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
