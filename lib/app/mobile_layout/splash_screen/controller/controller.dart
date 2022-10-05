import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/bottom_nav/view/bottom_nav.dart';
import 'package:turf_book_second_project/app/mobile_layout/login_page/view/login_page.dart';

class SplashScreenController extends GetxController {
  final storage = const FlutterSecureStorage();
  @override
  void onInit() {
    super.onInit();
    splashProvider();
  }

  String? data = '';
  splashProvider() {
    storage.read(key: "login").then((value) {
      data = value;
    });
    check();
  }

  check() {
    Timer(const Duration(seconds: 3), () {
      if (data == "true") {
        Get.offAll(() => const BottomNavigationMobile());
      } else {
        Get.offAll(() => const LoginPageMobile());
      }
    });
    update();
  }
}
