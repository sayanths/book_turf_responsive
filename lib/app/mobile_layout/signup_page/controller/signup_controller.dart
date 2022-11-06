import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/signup_page/api_service/signup_api.dart';
import 'package:turf_book_second_project/app/mobile_layout/signup_page/model/sign_up_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/signup_page/view/otp_page.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';

class SignUpControllerMobile extends GetxController {
  GlobalKey signUpKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final conformPasswordController = TextEditingController();
  RxBool isLoading = false.obs;

  singUp() async {
    if (passwordController.text != conformPasswordController.text) {
      Get.snackbar('Error Occured', 'Some error happend please check again',
          colorText: white);

      return;
    }
    isLoading.value = true;
    update();
    final result = SignUpModel(
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    );

    SignUpResponse? response = await SignUpApi().signUpUser(result);

    if (response != null) {
      isLoading.value = false;
      update();
      if (response.status!) {
        onSaveId(response.id!);
        Get.offAll(() => const OtpPage());
      }
    } else {}

    @override
    void onClose() {
      super.onClose();
      emailController.dispose();
      passwordController.dispose();
      conformPasswordController.dispose();
    }
  }

  onSaveId(String id) {
    FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
    flutterSecureStorage.write(key: 'userId', value: id);
    log(id);
  }
}
