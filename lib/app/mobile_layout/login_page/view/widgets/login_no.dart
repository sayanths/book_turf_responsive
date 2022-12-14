// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:turf_book_second_project/app/mobile_layout/login_page/controller/login_controller.dart';
// import 'package:turf_book_second_project/app/mobile_layout/login_page/view/widgets/custom_formfield.dart';
// import 'package:turf_book_second_project/app/mobile_layout/signup_page/view/signup_page.dart';
// import 'package:turf_book_second_project/app/utiles/colors.dart';
// import 'package:turf_book_second_project/app/utiles/fonts.dart';
// import 'package:turf_book_second_project/app/utiles/widgets.dart';

// class LoginWithNumber extends StatelessWidget {
//   const LoginWithNumber({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final loginController = Get.put(LoginControllerMobile());
//     return Scaffold(
//       backgroundColor: grey,
//       body:   Container(
//                 height: size.height / 1.5,
//                 width: size.width / 1.1,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.white10,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                   ),
//                   child: Form(
//                     key: loginController.loginKey,
//                     child: Column(
//                       children: [
//                         height50,
//                         Align(
//                             alignment: Alignment.topLeft,
//                             child: Text(
//                               "Login now",
//                               style: gfontsubtitlefont(cl: white, sz: 22),
//                             )),
//                         height10,
//                         CustomTextField(
//                           width: size.width / 1.5,
//                           controller: loginController.emailController,
//                           obsureText: false,
//                           keyboard: TextInputType.emailAddress,
//                           size: size,
//                           icon: Icons.email,
//                           title: '  enter email',
//                         ),
//                         SizedBox(
//                           height: size.height / 25,
//                         ),
//                         CustomTextField(
//                           width: size.width / 1.5,
//                           controller: loginController.passwordController,
//                           obsureText: true,
//                           keyboard: TextInputType.number,
//                           size: size,
//                           icon: Icons.password,
//                           title: '  enter password',
//                         ),
//                         SizedBox(
//                           height: size.height / 25,
//                         ),
//                         SizedBox(
//                             width: size.width / 1.5,
//                             child: Obx((() {
//                               return ElevatedButton(
//                                   onPressed: () {
//                                     loginController.loginApi();
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor:
//                                         const Color.fromARGB(255, 55, 0, 255),
//                                     shape: const StadiumBorder(),
//                                   ),
//                                   child:
//                                       loginController.isLoading == false
//                                           ? const Text("Create")
//                                           : const CupertinoActivityIndicator(
//                                               color: white));
//                             }))),
//                         height10,
//                         Row(
//                           children: [
//                             Text(
//                               "Forgot password ? ",
//                               style: gfontsubtitlefont(cl: white),
//                             ),
//                             InkWell(
//                                 // onTap: () =>
//                                 //     Get.to(() => ForgotpasswordView()),
//                                 child: Text(
//                               " Click here",
//                               style: gfontsubtitlefont(
//                                   cl: const Color.fromARGB(255, 0, 255, 255)),
//                             )),
//                           ],
//                         ),
//                         height10,
//                         Row(
//                           children: [
//                             Text(
//                               "Don't have an account ? ",
//                               style: gfontsubtitlefont(cl: white),
//                             ),
//                             InkWell(
//                                 onTap: () {
//                                   Get.to(() => const SignUpPageMobile());
//                                 },
//                                 child: Text(
//                                   " Click here",
//                                   style: gfontsubtitlefont(
//                                       cl: const Color.fromARGB(
//                                           255, 0, 255, 255)),
//                                 )),
//                           ],
//                         ),
//                         height30,
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             InkWell(
//                               onTap: () {},
//                               child: Image.network(
//                                 "https://res.cloudinary.com/sayanth/image/upload/v1662220924/zara%27s%20shopping%20app/zara%20shopping/google_vnwqmg.png",
//                                 height: 50,
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 // Get.to(() => PhoneloginView());
//                               },
//                               child: Image.network(
//                                 "https://res.cloudinary.com/sayanth/image/upload/v1663147673/email_ekjr0w.png",
//                                 height: 55,
//                                 color: white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//     );
//   }
// }
