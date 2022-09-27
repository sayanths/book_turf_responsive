import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpControllerMobile extends GetxController {
  final signUpKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final conformPasswordController = TextEditingController();

  onSignUpPressed() {
    if (signUpKey.currentState!.validate()) {
      return ;
    }
  }
}
