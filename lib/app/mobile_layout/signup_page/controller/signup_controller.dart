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
        Get.offAll(() => const OtpPage());
      }
    } else {
      return Get.snackbar('', 'Require all fields',
          colorText: white, duration: const Duration(seconds: 2));
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
