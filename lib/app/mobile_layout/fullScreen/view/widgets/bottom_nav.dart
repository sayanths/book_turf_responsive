import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/view/payment.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/fullscreen.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';
import 'package:turf_book_second_project/app/utiles/widgets.dart';

class CustomBottomNav extends StatelessWidget {
  final Datum data;
  const CustomBottomNav({
    Key? key,
    required this.size,
    required this.widget,
    required this. data,
  }) : super(key: key);

  final Size size;
  final FullScreenMobile widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 10,
      width: size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 2, 171, 8),
            Color.fromARGB(255, 0, 96, 3),
            Color.fromARGB(255, 2, 171, 8),
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          height10,
          height10,
          InkWell(
            onTap: () {
              Get.to(
                transition: Transition.cupertino,
                () => BookNow(
                  data: widget.data,
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: size.height / 20,
                  width: size.width / 1.9,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      "Book Now",
                      style: gfontsubtitlefont(
                        cl: white,
                        fw: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
