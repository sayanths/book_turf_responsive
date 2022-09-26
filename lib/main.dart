import 'package:flutter/material.dart';
import 'package:turf_book_second_project/app/desktop_layout/login_desktop/view/login_desktop.dart';
import 'package:turf_book_second_project/app/mobile_layout/login_page/view/login_page.dart';
import 'package:turf_book_second_project/app/responsive/layout.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ResponsiveLayout(
        mobileBody: const LoginPageMobile(),
        desktopBody: const LoginScreenDesktop(),
      ),
    );
  }
}
