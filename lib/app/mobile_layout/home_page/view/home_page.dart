import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/controller/controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/view/widget/custom_view.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/view/widget/search.dart';
import 'package:turf_book_second_project/app/mobile_layout/location/view/location.dart';
import 'package:turf_book_second_project/app/mobile_layout/view_all/view/view_all.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';
import 'package:turf_book_second_project/app/utiles/simmer.dart';
import 'package:turf_book_second_project/app/utiles/widgets.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomePageControllerMobile());
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              height30,
              Search(size: size),
              height10,
              height10,
             // Home(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: const [
                    Icon(Icons.location_pin),
                    Text("calicut,kerala,India")
                  ],
                ),
              ),
              height10,
              height10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      "Near",
                      style: Lato(cl: black, sz: 28, fw: FontWeight.bold),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(() => const ViewAll(),
                            transition: Transition.cupertino);
                      },
                      child: Text(
                        "view All",
                        style: gfontsubtitlefont(cl: grey),
                      ),
                    ),
                  ],
                ),
              ),
              GetBuilder<HomePageControllerMobile>(builder: (homeCntrl) {
                return homeCntrl.vendorTurfList.isEmpty
                    ? SimmerCustomWidget(
                        hight: size.height / 3.6,
                        width: size.width / 2.2,
                        shapeBorder: ShapeDecoration(
                          color: Colors.grey[400]!,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      )
                    : LimitedBox(
                        maxHeight: size.height / 3,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Top Rated",
                      style: Lato(cl: black, sz: 25, fw: FontWeight.bold),
                    )),
              ),
              GetBuilder<HomePageControllerMobile>(builder: (homeCntrl) {
                return homeCntrl.topRatedList.isEmpty
                    ? SimmerCustomWidget(
                        hight: size.height / 3.6,
                        width: size.width / 2.2,
                        shapeBorder: ShapeDecoration(
                          color: Colors.grey[400]!,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      )
                    : LimitedBox(
                        maxHeight: size.height / 3,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(5),
                            scrollDirection: Axis.horizontal,
                            itemCount: homeController.topRatedList.length,
                            itemBuilder: (context, index) {
                              final data = homeController.topRatedList[index];
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
