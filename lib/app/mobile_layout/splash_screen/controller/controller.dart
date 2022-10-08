import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_book_second_project/app/mobile_layout/bottom_nav/view/bottom_nav.dart';
import 'package:turf_book_second_project/app/mobile_layout/login_page/view/login_page.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkUserLogin();
  }

  void checkUserLogin() async {
    final obj = await SharedPreferences.getInstance();
    bool data = obj.getBool('userLoged') ?? false;

    Timer(const Duration(seconds: 2), () {
      data
          ? Get.offAll(() => const BottomNavigationMobile())
          : Get.offAll(() => const LoginPageMobile());
    });
  }
}
