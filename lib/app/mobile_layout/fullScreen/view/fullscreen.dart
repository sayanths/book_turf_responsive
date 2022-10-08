import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/emojione_monotone.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/iconoir.dart';
import 'package:iconify_flutter/icons/map.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/view/widgets/custom_back_button.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/amenities.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/bottom_nav.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/custom_appbar.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/full_screen_title.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/ground_suits.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';
import 'package:turf_book_second_project/app/utiles/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class FullScreenMobile extends StatefulWidget {
  final Datum data;
  const FullScreenMobile({super.key, required this.data});
  @override
  State<FullScreenMobile> createState() => _FullScreenMobileState();
}

class _FullScreenMobileState extends State<FullScreenMobile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Align(
                    alignment: Alignment.topLeft, child: CustomBackButton()),
              ),
              CustomAppBar(
                mainTitle: widget.data.turfName.toString(),
                color: widget.data.turfInfo!.turfIsAvailale!
                    ? const Color.fromARGB(255, 3, 199, 10)
                    : Colors.red,
                rating: widget.data.turfInfo!.turfRating.toString(),
                star: "⭐",
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
              const FullScreenTitle(title: "Amenities", size: 20),
              height10,
              Wrap(
                children: [
                  widget.data.turfAmenities!.turfWashroom!
                      ? AmenitiesWidget(
                          size: size,
                          iconify: const Iconify(Map.toilet),
                          title: "Washroom")
                      : sizedboxCoustom,
                  widget.data.turfAmenities!.turfCafeteria!
                      ? AmenitiesWidget(
                          size: size,
                          iconify: const Iconify(Ic.baseline_local_cafe),
                          title: "Cafe")
                      : sizedboxCoustom,
                  widget.data.turfAmenities!.turfGallery!
                      ? AmenitiesWidget(
                          size: size,
                          iconify: const Iconify(Ic.round_stadium),
                          title: "Gallery")
                      : sizedboxCoustom,
                  widget.data.turfAmenities!.turfParking!
                      ? AmenitiesWidget(
                          size: size,
                          iconify: const Iconify(Ri.parking_fill),
                          title: "Parking")
                      : sizedboxCoustom,
                  widget.data.turfAmenities!.turfWater!
                      ? AmenitiesWidget(
                          size: size,
                          iconify: const Iconify(Ri.water_flash_fill),
                          title: "Water")
                      : sizedboxCoustom,
                  widget.data.turfAmenities!.turfDressing!
                      ? AmenitiesWidget(
                          size: size,
                          iconify: const Iconify(Ri.shirt_fill),
                          title: "Dressing")
                      : sizedboxCoustom,
                ],
              ),
              height10,
              height10,
              const FullScreenTitle(
                title: "Ground Suits for ",
                size: 20,
              ),
              height30,
              Wrap(
                children: [
                  GroundSuitWidget(
                    child: widget.data.turfCatogery!.turfCricket!
                        ? const GroundSuitsWidget(
                            icon: Iconify(EmojioneMonotone.cricket),
                          )
                        : sizedboxCoustom,
                  ),
                  GroundSuitWidget(
                    child: widget.data.turfCatogery!.turfFootball!
                        ? const GroundSuitsWidget(
                            icon: Iconify(Bx.football),
                          )
                        : sizedboxCoustom,
                  ),
                  GroundSuitWidget(
                    child: widget.data.turfCatogery!.turfBadminton!
                        ? const GroundSuitsWidget(
                            icon: Iconify(EmojioneMonotone.badminton),
                          )
                        : sizedboxCoustom,
                  ),
                  GroundSuitWidget(
                    child: widget.data.turfCatogery!.turfYoga!
                        ? const GroundSuitsWidget(
                            icon: Iconify(Iconoir.yoga),
                          )
                        : sizedboxCoustom,
                  ),
                ],
              ),
              height30,
              ElevatedButton.icon(
                onPressed: (() async {
                  final Uri url =
                      Uri.parse(widget.data.turfInfo!.turfMap.toString());
                  if (await launchUrl(url)) {
                    await launchUrl(Uri());
                  }
                }),
                icon: const Iconify(
                  Map.map_pin,
                  color: white,
                ),
                label: const Text("Show the Location"),
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(), backgroundColor: red),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNav(size: size, widget: widget),
      ),
    );
  }
}
