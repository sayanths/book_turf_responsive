import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/controller/controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/view/home_page.dart';

class ErrorDialogueWidget extends StatelessWidget {
  final String text;
  const ErrorDialogueWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FittedBox(
                  child: Text(
                text,
              )),
            ),
          ),
          TextButton.icon(
            onPressed: () async {
              Get.to(() => const HomePageMobile());
              Get.put(HomePageControllerMobile()).fetchDetails();
            },
            icon: const Icon(Icons.refresh),
            label: const Text("Refresh"),
          ),
        ],
      ),
    );
  }
}
