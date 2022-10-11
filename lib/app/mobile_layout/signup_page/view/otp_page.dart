import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:turf_book_second_project/app/mobile_layout/signup_page/controller/otp_controller.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';
import 'package:turf_book_second_project/app/utiles/widgets.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final optControllerPage = OptController();
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              height30,
              const CustomBackArrowWithTitle(
                title: 'Verification code',
              ),
              height50,
              Text(
                "We have  sent the code verification to",
                style: gfontsubtitlefont(
                  cl: grey,
                ),
              ),
              height10,
              Text(
                "XX..@gmail.com",
                style: gfontsubtitlefont(cl: white),
              ),
              height30,
              Form(
                key: optControllerPage.otpKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OtpTypingContainer(
                      controller: optControllerPage.otp1,
                    ),
                    OtpTypingContainer(
                      controller: optControllerPage.otp2,
                    ),
                    OtpTypingContainer(
                      controller: optControllerPage.otp3,
                    ),
                    OtpTypingContainer(
                      controller: optControllerPage.otp4,
                    ),
                  ],
                ),
              ),
              height50,
              ElevatedButton(
                onPressed: () {
                  optControllerPage.otpData();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 20, 238),
                  shape: const StadiumBorder(),
                ),
                child: const Text("Sumbit otp"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtpTypingContainer extends StatelessWidget {
  final TextEditingController controller;
  const OtpTypingContainer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 56,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          onChanged: (value) {
            value.length == 1 ? FocusScope.of(context).nextFocus() : null;
          },
          decoration: const InputDecoration(border: InputBorder.none),
          style: Theme.of(context).textTheme.headline6,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
      ),
    );
  }
}

class CustomBackArrowWithTitle extends StatelessWidget {
  final String title;
  const CustomBackArrowWithTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: white,
              )),
        ),
        Text(
          title,
          style: gfontsubtitlefont(
            cl: white,
            sz: 30,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
