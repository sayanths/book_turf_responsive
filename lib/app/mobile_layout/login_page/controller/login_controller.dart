import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/bottom_nav/view/bottom_nav.dart';
import 'package:turf_book_second_project/app/mobile_layout/login_page/model/login_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/login_page/service/login_service.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';

class LoginControllerMobile extends GetxController {
  final loginKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isLoading = false.obs;
  loginApi() async {
    late final email = emailController.text;
    late final password = passwordController.text;
    final model = LoginModel(
      email: email,
      password: password,
    );
    isLoading.value = true;
    update();

    LoginResponse? response = await Api().loginUser(model);

    if (response != null) {
      isLoading.value = false;
      if (response.status!) {
        Get.offAll(() => const BottomNavigationMobile());
      } else {
        // ignore: avoid_print
        print(response.message.toString());
      }
    } else {
      return Get.snackbar('Not found!!', 'The user not found',
          colorText: white, duration: const Duration(seconds: 2));
    }
  }

  onLoginPresed() {
    if (loginKey.currentState!.validate()) {
      return loginApi();
    }
  }
}
