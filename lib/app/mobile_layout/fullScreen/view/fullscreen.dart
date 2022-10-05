import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/emojione_monotone.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/iconoir.dart';
import 'package:iconify_flutter/icons/map.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/amenities.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/bottom_nav.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/custom_appbar.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/full_screen_title.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/ground_suits.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view_model/view_model_controller.dart';
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
    final viewFull = Get.put(ViewFullScreen());
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          iconTheme: const IconThemeData(color: black),
        ),
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                mainTitle: widget.data.turfName.toString(),
                color: widget.data.turfInfo!.turfIsAvailale == true
                    ? const Color.fromARGB(255, 3, 199, 10)
                    : Colors.red,
                rating: widget.data.turfInfo!.turfRating.toString(),
              ),
              height10,
              height10,
              Image.network(
                widget.data.turfImages!.turfImages3.toString(),
                height: size.height / 4,
                width: size.width / 1.1,
                fit: BoxFit.cover,
              ),
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
              Wrap(
                children: [
                  widget.data.turfAmenities!.turfWashroom == true
                      ? AmenitiesWidget(
                          size: size,
                          iconify: const Iconify(
                            Map.toilet,
                          ),
                          title: "Washroom",
                        )
                      : sizedboxCoustom,
                  widget.data.turfAmenities!.turfCafeteria == true
                      ? AmenitiesWidget(
                          size: size,
                          iconify: const Iconify(Ic.baseline_local_cafe),
                          title: "Cafe",
                        )
                      : sizedboxCoustom,
                  widget.data.turfAmenities!.turfGallery == true
                      ? AmenitiesWidget(
                          size: size,
                          iconify: const Iconify(
                            Ic.round_stadium,
                          ),
                          title: "Gallery",
                        )
                      : sizedboxCoustom,
                  widget.data.turfAmenities!.turfParking == true
                      ? AmenitiesWidget(
                          size: size,
                          iconify: const Iconify(
                            Ri.parking_fill,
                          ),
                          title: "Parking",
                        )
                      : sizedboxCoustom,
                ],
              ),
              height10,
              height10,
              const FullScreenTitle(
                title: "Ground Suits ",
                size: 20,
              ),
              
              height30,
              Wrap(
                children: [
                  GroundSuitWidget(
                    child: widget.data.turfCatogery!.turfCricket == true
                        ? const GroundSuitsWidget(
                            icon: Iconify(
                              EmojioneMonotone.cricket,
                            ),
                          )
                        : sizedboxCoustom,
                  ),
                  GroundSuitWidget(
                    child: widget.data.turfCatogery!.turfFootball == true
                        ? const GroundSuitsWidget(
                            icon: Iconify(
                              Bx.football,
                            ),
                          )
                        : sizedboxCoustom,
                  ),
                  GroundSuitWidget(
                    child: widget.data.turfCatogery!.turfBadminton == true
                        ? const GroundSuitsWidget(
                            icon: Iconify(
                              EmojioneMonotone.badminton,
                            ),
                          )
                        : sizedboxCoustom,
                  ),
                  GroundSuitWidget(
                    child: widget.data.turfCatogery!.turfYoga == true
                        ? const GroundSuitsWidget(
                            icon: Iconify(
                              Iconoir.yoga,
                            ),
                          )
                        : sizedboxCoustom,
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNav(size: size, widget: widget),
      ),
    );
  }
}
