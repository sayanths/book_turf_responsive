import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

//  name(String value){
//     if (!RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$')
//                                       .hasMatch(value) ||
//                                   value.length < 3) {
//                                 return Get.snackbar(title, message);
//                               } else {
//                                 return null;
//                               }
//  }

  Future<void> loginApi(BuildContext ctx) async {
    isLoading.value = true;
    late final email = emailController.text.trim();
    late final password = passwordController.text.trim();
    if (password.isEmpty || email.isEmpty) {
      Get.snackbar('please fill', 'All fields are Requires', colorText: white);
      isLoading.value = false;
      return;
    }

    final model = LoginModel(email: email, password: password);

    final response = await Api().loginUser(model);
    isLoading.value = false;
    if (response != null) {
      if (response.status!) {
        getToken(response);
        Get.offAll(() => const BottomNavigationMobile());
      } else {
        Get.snackbar(response.message.toString(), '');
      }
    } else {
      Get.snackbar('', 'internet not found');
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   loginApi();
  // }

  bool isObscure = true;
  passwordHide() {
    isObscure = !isObscure;
    update();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  Future<void> getToken(LoginResponse value) async {
    await secureStorage.write(key: 'token', value: value.token);
    await secureStorage.write(key: 'refreshToken', value: value.refreshToken);
    await secureStorage.write(key: 'login', value: 'true');
  }
  // getToken() async {
  //   return await storage.read(key: 'token');
  // }

  // getRefreshToken() async {
  //   return await storage.read(key: 'refreshToken');
  // }
  hideLoading() {
    isLoading.value = false;
  }
}
