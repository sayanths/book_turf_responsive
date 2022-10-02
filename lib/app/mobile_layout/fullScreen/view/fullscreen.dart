import 'package:flutter/material.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/widgets.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';
import 'package:turf_book_second_project/app/utiles/widgets.dart';

class FullScreenMobile extends StatelessWidget {
  final Datum data;
  const FullScreenMobile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          iconTheme: const IconThemeData(color: black),
        ),
        backgroundColor: white,
        body: Column(
          children: [
            FullScreenTitle(title: data.turfName.toString()),
            Hero(
             // transitionOnUserGestures: true,
              tag: 'image1',
              child: Image.network(data.turfImages!.turfImages3.toString(),
                  height: size.height / 4,
                  width: size.width / 1.1,
                  fit: BoxFit.cover),
            ),
            height30,
            const FullScreenTitle(title: "Amenities"),
          ],
        ),
        bottomNavigationBar: Container(
          height: size.height / 5,
          width: size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 2, 171, 8),
                Color.fromARGB(255, 0, 96, 3),
                Color.fromARGB(255, 2, 171, 8),
              ],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Column(
            children: [
              height10,
              height10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FullViewCallAndChat(
                    colorx: darkBlue,
                    function: () {},
                    title: 'Chat',
                    icon: Icons.message,
                  ),
                  FullViewCallAndChat(
                    colorx: darkBlue,
                    function: () {},
                    title: 'call',
                    icon: Icons.call,
                  ),
                ],
              ),
              height10,
              height10,
              Container(
                height: size.height / 20,
                width: size.width / 1.2,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "Book Now",
                    style: gfontsubtitlefont(
                      cl: white,
                      fw: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FullScreenTitle extends StatelessWidget {
  final String title;
  const FullScreenTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: gfontsubtitlefont(sz: 30),
          ),
        ],
      ),
    );
  }
}
