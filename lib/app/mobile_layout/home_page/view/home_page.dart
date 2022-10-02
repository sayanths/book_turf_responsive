import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:shimmer/shimmer.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/controller/controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/view/widget/custom_view.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/view/widget/search.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';
import 'package:turf_book_second_project/app/utiles/widgets.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomePageControllerMobile());
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 219, 219),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 219, 219, 219),
        toolbarHeight: 70,
      ),
      drawer: const Drawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Search(size: size),
              height10,
              height10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Iconify(
                      Carbon.location_current,
                      color: black,
                    ),
                    Text(
                      "Kannur,Kerala,India",
                      style: Lato(cl: black),
                    ),
                  ],
                ),
              ),
              height10,
              height10,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Near",
                      style: Lato(cl: black, sz: 30, fw: FontWeight.bold),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "view All",
                        style: gfontsubtitlefont(cl: black),
                      ),
                    ),
                  ],
                ),
              ),
              GetBuilder<HomePageControllerMobile>(builder: (homeCntrl) {
                return homeCntrl.vendorTurfList.isEmpty
                    ? Shimmer.fromColors(
                        baseColor: grey,
                        highlightColor: red,
                        child: Container())
                    : LimitedBox(
                        maxHeight: size.height,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(5),
                            scrollDirection: Axis.horizontal,
                            itemCount: homeController.vendorTurfList.length,
                            itemBuilder: (context, index) {
                              final data = homeController.vendorTurfList[index];
                              return CustomSnackImageShower(data: data);
                            }),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
