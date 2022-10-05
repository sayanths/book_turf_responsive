import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/emojione_monotone.dart';
import 'package:iconify_flutter/icons/iconoir.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/bottom_nav.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/full_screen_title.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/ground_suits.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/controller/controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';
import 'package:turf_book_second_project/app/utiles/widgets.dart';

class FullScreenMobile extends StatefulWidget {
  final Datum data;
  const FullScreenMobile({
    super.key,
    required this.data,
  });

  @override
  State<FullScreenMobile> createState() => _FullScreenMobileState();
}

class _FullScreenMobileState extends State<FullScreenMobile> {
  late TextEditingController _amountController;
//  late Razorpay _razorpay;
  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final page = Get.put(HomePageControllerMobile());
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
            Row(
              children: [
                FullScreenTitle(
                  title: widget.data.turfName.toString(),
                  size: 30,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: widget.data.turfInfo!.turfIsAvailale == true
                              ? const Color.fromARGB(255, 3, 199, 10)
                              : Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("⭐"),
                      Text(widget.data.turfInfo!.turfRating.toString()),
                    ],
                  ),
                ),
              ],
            ),
            height10,
            height10,
            Image.network(widget.data.turfImages!.turfImages3.toString(),
                height: size.height / 4,
                width: size.width / 1.1,
                fit: BoxFit.cover),
            height10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.data.turfMuncipality.toString(),
                  style: gfontsubtitlefont(cl: grey),
                ),
                Text(widget.data.turfPlace.toString(),
                    style: gfontsubtitlefont(cl: grey)),
              ],
            ),
            height30,
            const FullScreenTitle(
              title: "Amenities",
              size: 20,
            ),
            height10,
            // LimitedBox(
            //   maxHeight: 100,
            //   child: GridView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 6,
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 1,
            //       mainAxisSpacing: 1,
            //       crossAxisSpacing: 2,
            //     ),
            //     itemBuilder: (context, index) {
            //       return Container(
            //         color: red,
            //         child: Row(
            //           children: const [
            //             //Text("Wahsroom")
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
            height10,
            const FullScreenTitle(
              title: "Ground Suits ",
              size: 20,
            ),
            height10,
            Wrap(
              children: [
                GroundSuitWidget(
                    child: widget.data.turfCatogery!.turfCricket == true
                        ? const GroundSuitsWidget(
                            icon: Iconify(
                              EmojioneMonotone.cricket,
                            ),
                          )
                        : const SizedBox()),
                GroundSuitWidget(
                    child: widget.data.turfCatogery!.turfFootball == true
                        ? const GroundSuitsWidget(
                            icon: Iconify(
                              Bx.football,
                            ),
                          )
                        : const SizedBox()),
                GroundSuitWidget(
                    child: widget.data.turfCatogery!.turfBadminton == true
                        ? const GroundSuitsWidget(
                            icon: Iconify(
                              EmojioneMonotone.badminton,
                            ),
                          )
                        : const SizedBox()),
                GroundSuitWidget(
                    child: widget.data.turfCatogery!.turfYoga == true
                        ? const GroundSuitsWidget(
                            icon: Iconify(
                              Iconoir.yoga,
                            ),
                          )
                        : const SizedBox()),
              ],
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNav(size: size, widget: widget),
      ),
    );
  }
}
