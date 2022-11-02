import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/controller/controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/view/search.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/view/widget/custom_view.dart';
import 'package:turf_book_second_project/app/mobile_layout/location/service/location_service.dart';
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
    Get.put(GetUserLoction());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 76, 3),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const SearchView());
              },
              icon: const Icon(
                Icons.search,
                color: white,
              ))
        ],
      ),
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height / 20,
                width: size.width,
                color: const Color.fromARGB(255, 226, 244, 227),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: GetBuilder<GetUserLoction>(
                      builder: (location) {
                        return TextButton.icon(
                            onPressed: () {
                              location.getUserLocation();
                            },
                            icon: const Icon(
                              Icons.location_pin,
                              color: black,
                            ),
                            label: location.userDetails == null
                                ? const Text(
                                    'Get your location',
                                    style: TextStyle(color: black),
                                  )
                                : Text(
                                    location.userDetails.toString(),
                                    style: const TextStyle(color: black),
                                  ));
                      },
                    )),
              ),
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
                        style: gfontsubtitlefont(cl: black),
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
                              return homeCntrl.vendorTurfList.isEmpty
                                  ? SimmerCustomWidget(
                                      hight: size.height / 3.6,
                                      width: size.width / 2.2,
                                      shapeBorder: ShapeDecoration(
                                        color: Colors.grey[400]!,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    )
                                  : CustomSnackImageShower(data: data);
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
              height10,
              Container(
                height: size.height / 3,
                width: size.width,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 217, 217, 217),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child:
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
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomSnackImageShower(data: data,),
                                );
                              }),
                        );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
