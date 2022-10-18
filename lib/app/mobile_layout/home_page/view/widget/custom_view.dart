import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/fullscreen.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/controller/controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/controller/favourite.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';

class CustomSnackImageShower extends StatelessWidget {
  final Datum data;
  const CustomSnackImageShower({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fav = Get.put(FavouriteController());
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Get.to(() => FullScreenMobile(data: data));
            },
            child: Container(
              height: size.height / 3.6,
              width: size.width / 2.2,
              decoration: BoxDecoration(
                color: Colors.white10,
                image: DecorationImage(
                  image: Image.network(
                    data.turfImages!.turfImages3.toString(),
                  ).image,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 120,
                    top: -9,
                    child: IconButton(
                      onPressed: () {
                        fav.addToFavorite(data);
                      },
                      icon: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                        child: Icon(
                          Icons.favorite,
                          color: red,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Stack(
                      children: [
                        Container(
                          height: 50,
                          width: size.width / 2.2,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 0, 87, 3),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                          ),
                          child: Center(
                            child: Text(
                              data.turfName.toString(),
                              style: gfontsubtitlefont(
                                  cl: white, sz: 20, fw: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
