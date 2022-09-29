import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/signup_page/api_service/signup_api.dart';
import 'package:turf_book_second_project/app/mobile_layout/signup_page/model/sign_up_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/signup_page/view/otp_page.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';

class SignUpControllerMobile extends GetxController {
  final signUpKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final conformPasswordController = TextEditingController();
  RxBool isLoading = false.obs;

  singUp() async {
    // isLoading.value = true;

    if (passwordController.text != conformPasswordController.text) {
      Get.snackbar('Error Occured', 'Some error happend please check again',
          colorText: white);

      return;
    }

    final result = SignUpModel(
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    );

    SignUpResponse? response = await SignUpApi().signUpUser(result);
   
    if (response != null) {
      if (response.status == true) {
        Get.offAll(() => const OtpPage());
      } else {
        Get.snackbar('sdds', 'dsd');
      }
    }
  }

  onSignUpPressed() {
    if (signUpKey.currentState!.validate()) {
      singUp();
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
    conformPasswordController.dispose();
  }
}
