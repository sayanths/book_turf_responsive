import 'dart:async';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/bottom_nav/view/bottom_nav.dart';
import 'package:turf_book_second_project/app/mobile_layout/login_page/view/login_page.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    splashProvider();
    super.onInit();
  }
  // @override
  // void onInit() {
  //   super.onInit();
  //   checkUserLogin();
  // }

  // void checkUserLogin() async {

  //   Timer(const Duration(seconds: 2), () {
  //     data
  //         ? Get.offAll(() => const BottomNavigationMobile())
  //         : Get.offAll(() => LoginPageMobile());
  //   });
  //   update();
  // }
  final storage = const FlutterSecureStorage();

  String? data = '';
  splashProvider() {
    storage.read(key: 'login').then((value) {
      data = value;
      log(value.toString());
    });
    check();
  }

  check() {
    Timer(const Duration(seconds: 2), () {
      data == 'true'
          ? Get.offAll(() => const BottomNavigationMobile())
          : Get.offAll(() => LoginPageMobile());
    });
    update();
  }
}
