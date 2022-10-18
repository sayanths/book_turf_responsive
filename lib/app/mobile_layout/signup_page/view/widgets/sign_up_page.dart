import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';

class CustomLoginInSignUp extends StatelessWidget {
  const CustomLoginInSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: Text(
        "login",
        style: gfontsubtitlefont(
          cl: white,
          sz: 15,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
