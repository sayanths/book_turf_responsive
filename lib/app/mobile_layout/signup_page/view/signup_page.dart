import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/login_page/view/widgets/custom_formfield.dart';
import 'package:turf_book_second_project/app/mobile_layout/login_page/view/widgets/glass_container.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';
import 'package:turf_book_second_project/app/utiles/widgets.dart';

class SignUpPageMobile extends StatelessWidget {
  const SignUpPageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                height50,
                CustomBackArrowWithTitle(
                  title: 'Create an Account',
                ),
                height50,
                LoginGlassContainer(
                  size: size,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextField(
                        obsureText: false,
                       // controller: signUpController.nameController,
                          size: size,
                          icon: Icons.person,
                          title: " Please enter the user name",
                          keyboard: TextInputType.name),
                      CustomTextField(
                        obsureText: false,
                       // controller: signUpController.numberController,
                          size: size,
                          icon: Icons.call,
                          title: " Please enter the number",
                          keyboard: TextInputType.name),
                      CustomTextField(
                        obsureText: false,
                        //controller: signUpController.passwordController,
                          size: size,
                          icon: Icons.password,
                          title: " Please enter the password",
                          keyboard: TextInputType.name),
                      CustomTextField(
                        obsureText: false,
                       // controller: signUpController.confromPasswordController,
                          size: size,
                          icon: Icons.password_outlined,
                          title: " conform password",
                          keyboard: TextInputType.name),
                      SizedBox(
                        width: size.width / 1.5,
                        child: ElevatedButton(
                          onPressed: () {
                            // Get.offAll(() => BottomnavbarView(),
                            //     transition: Transition.circularReveal);
                          },
                          child: Text("Create"),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 55, 0, 255),
                            shape: StadiumBorder(),
                          ),
                        ),
                      ),
                    ],
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
              icon: Icon(
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
