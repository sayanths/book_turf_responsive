import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/login_page/view/widgets/custom_formfield.dart';
import 'package:turf_book_second_project/app/mobile_layout/login_page/view/widgets/glass_container.dart';
import 'package:turf_book_second_project/app/mobile_layout/signup_page/controller/signup_controller.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              height50,
              const CustomBackArrowWithTitle(
                title: 'Create an Account',
              ),
              height50,
              LoginGlassContainer(
                size: size,
                child: Form(
                  key: signUpController.signUpKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextField(
                          width: size.width / 1.5,
                          obsureText: false,
                          controller: signUpController.emailController,
                          size: size,
                          icon: Icons.email,
                          title: " Enter Email",
                          keyboard: TextInputType.emailAddress),
                      CustomTextField(
                          width: size.width / 1.5,
                          obsureText: true,
                          controller: signUpController.passwordController,
                          size: size,
                          icon: Icons.password,
                          title: "  Enter password",
                          keyboard: TextInputType.visiblePassword),
                      CustomTextField(
                          width: size.width / 1.5,
                          obsureText: true,
                          controller:
                              signUpController.conformPasswordController,
                          size: size,
                          icon: Icons.password_outlined,
                          title: " conform password",
                          keyboard: TextInputType.name),
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
                                child: signUpController.isLoading.value==false
                                    ? const Text("Create")
                                    : const CupertinoActivityIndicator(
                                        color: white));
                          }))),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBackArrowWithTitle extends StatelessWidget {
  final String title;
  const CustomBackArrowWithTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: white,
              )),
        ),
        Text(
          title,
          style: gfontsubtitlefont(
            cl: white,
            sz: 30,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
