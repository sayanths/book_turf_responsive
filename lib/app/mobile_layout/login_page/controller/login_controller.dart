import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/bottom_nav/view/bottom_nav.dart';
import 'package:turf_book_second_project/app/mobile_layout/login_page/model/login_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/login_page/service/login_service.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';

class LoginControllerMobile extends GetxController {
  GlobalKey loginKey = GlobalKey<FormState>();

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
        getToken(response);
        Get.snackbar('Sucessfull', 'Sucessfully logged in',
            colorText: white, duration: const Duration(seconds: 2));
        Get.offAll(() => const BottomNavigationMobile());
      } else {
        Get.snackbar('login failed!!', response.message.toString(),
            colorText: white, duration: const Duration(seconds: 2));
      }
    } else {
      return Get.snackbar('Not found!!', 'The user not found',
          colorText: white, duration: const Duration(seconds: 2));
    }
  }

  @override
  void onInit() {
    super.onInit();
    loginApi();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  getToken(LoginResponse value) async {
    await secureStorage.write(key: 'token', value: value.token);
    await secureStorage.write(key: 'refreshToken', value: value.refreshToken);
    await secureStorage.write(key: 'loginTrue', value: 'true');
  }
}
