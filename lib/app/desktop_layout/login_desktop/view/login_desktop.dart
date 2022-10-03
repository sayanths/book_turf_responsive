import 'package:flutter/material.dart';
import 'package:turf_book_second_project/app/mobile_layout/login_page/view/widgets/custom_formfield.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';
import 'package:turf_book_second_project/app/utiles/widgets.dart';

class LoginScreenDesktop extends StatelessWidget {
  const LoginScreenDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: size.height / 1.6,
                  color: const Color.fromARGB(255, 0, 55, 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                          width: size.width / 5,
                          size: size,
                          icon: Icons.person,
                          title: "enter to login",
                          keyboard: TextInputType.emailAddress,
                          obsureText: false),
                      height30,
                      CustomTextField(
                          width: size.width / 5,
                          size: size,
                          icon: Icons.password,
                          title: "enter password",
                          keyboard: TextInputType.visiblePassword,
                          obsureText: true),
                      height30,
                      SizedBox(
                        width: size.width / 5,
                        height: size.height / 18,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.login),
                          label: const Text("Login"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ),
                      height30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forgot password ? ",
                            style: gfontsubtitlefont(cl: white),
                          ),
                          InkWell(
                              // onTap: () =>
                              //     Get.to(() => ForgotpasswordView()),
                              child: Text(
                            " Click here",
                            style: gfontsubtitlefont(
                                cl: const Color.fromARGB(255, 0, 255, 255)),
                          )),
                        ],
                      ),
                      height10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account ? ",
                            style: gfontsubtitlefont(cl: white),
                          ),
                          InkWell(
                              onTap: () {
                                // Get.to(() => const SignUpPageMobile());
                              },
                              child: Text(
                                " Click here",
                                style: gfontsubtitlefont(
                                  cl: const Color.fromARGB(255, 0, 255, 255),
                                ),
                              )),
                        ],
                      ),
                      height30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Image.network(
                              "https://res.cloudinary.com/sayanth/image/upload/v1662220924/zara%27s%20shopping%20app/zara%20shopping/google_vnwqmg.png",
                              height: 50,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Get.to(() => PhoneloginView());
                            },
                            child: Image.network(
                              "https://res.cloudinary.com/sayanth/image/upload/v1663998187/toppng.com-registration-and-login-screen-mobile-phone-registration-smartphone-icon-black-980x980_cqgduv.png",
                              height: 55,
                              color: white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: size.height / 1.6,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://media.istockphoto.com/photos/unrecognizable-little-football-player-against-green-grass-studi-picture-id544809756?k=20&m=544809756&s=612x612&w=0&h=bnxFbTVFtYSsrEBdO5NnnUL2tZbAzUcv2xezEFJkX1M=",
                          ),
                          fit: BoxFit.cover)),
                ),
              ),
            ],
          ),
          const Text("About Us"),
          const Flexible(
              child: Text(
                  "We are providing the service for the people to book the turf online in their respective area and also .You all can be a truf admin and also you can post about your turf in this website"))
        ],
      ),
    );
  }
}
