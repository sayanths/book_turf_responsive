import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/bottom_nav/controller/controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/favourite/view/bottom_nav.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/view/home_page.dart';
import 'package:turf_book_second_project/app/mobile_layout/notification/controller/controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/notification/view/bottom_nav.dart';
import 'package:turf_book_second_project/app/mobile_layout/profile/view/bottom_nav.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';

class BottomNavigationMobile extends StatelessWidget {
  const BottomNavigationMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNNavController());
    return Scaffold(
      backgroundColor: black,
      //resizeToAvoidBottomInset: false,
      body: GetBuilder<BottomNNavController>(
        builder: (context) {
          return context.pages[context.pageIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<BottomNNavController>(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: BottomNavigationBar(
              selectedItemColor: blue,
              unselectedItemColor: white,
              backgroundColor: black,
              currentIndex: controller.pageIndex,
              onTap: ((newIndex) {
                controller.onClick(newIndex);
              }),
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notification_add), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
              ],
            ),
          ),
        );
      }),
    );
  }
}
