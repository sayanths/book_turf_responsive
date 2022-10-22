import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/login_page/view/widgets/custom_formfield.dart';
import 'package:turf_book_second_project/app/mobile_layout/login_page/view/widgets/glass_container.dart';
import 'package:turf_book_second_project/app/mobile_layout/signup_page/controller/signup_controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/signup_page/view/widgets/sign_up_page.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';
import 'package:turf_book_second_project/app/utiles/widgets.dart';

class SignUpPageMobile extends StatelessWidget {
  const SignUpPageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signUpController = Get.put(SignUpControllerMobile());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 69, 2),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/bg2.jpg",
                ),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
                children: [
                  height50,
                  Text(
                    "Create an Account",
                    style: gfontsubtitlefont(
                      cl: white,
                      sz: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  height30,
                  LoginGlassContainer(
                    size: size,
                    child: Form(
                      key: signUpController.signUpKey,
                      child: Column(
                        children: [
                          height50,
                          height30,
                          CustomTextField(
                              width: size.width / 1.3,
                              obsureText: false,
                              controller: signUpController.emailController,
                              size: size,
                              icon: Icons.email,
                              title: " Enter Email",
                              keyboard: TextInputType.emailAddress),
                          height20,
                          CustomTextField(
                              width: size.width / 1.3,
                              obsureText: true,
                              controller: signUpController.passwordController,
                              size: size,
                              icon: Icons.password,
                              title: "  Enter password",
                              keyboard: TextInputType.visiblePassword),
                          height20,
                          CustomTextField(
                              width: size.width / 1.3,
                              obsureText: true,
                              controller:
                                  signUpController.conformPasswordController,
                              size: size,
                              icon: Icons.password_outlined,
                              title: " conform password",
                              keyboard: TextInputType.name),
                          height20,
                          SizedBox(
                              width: size.width / 1.5,
                              child: Obx((() {
                                return ElevatedButton(
                                    onPressed: () {
                                      signUpController.singUp();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromARGB(255, 55, 0, 255),
                                      shape: const StadiumBorder(),
                                    ),
                                    child: signUpController.isLoading.value ==
                                            false
                                        ? const Text("Create")
                                        : const CupertinoActivityIndicator(
                                            color: white));
                              }))),
                          height20,
                          const CustomLoginInSignUp(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
