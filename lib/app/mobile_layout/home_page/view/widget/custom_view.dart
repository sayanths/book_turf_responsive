import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';

class CustomSnackImageShower extends StatelessWidget {
  const CustomSnackImageShower({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: size.height / 3.6,
            width: size.width / 2.2,
            decoration: BoxDecoration(
              color: Colors.white10,
              image: const DecorationImage(
                image: NetworkImage(
                  "https://5.imimg.com/data5/LC/IL/MY-14051731/football-turf-500x500.jpg",
                ),
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: red,
                      size: 30.0,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Stack(
                    children: [
                      Container(
                        height: 40,
                        width: size.width / 2.2,
                        decoration: const BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                        ),
                        child: Center(
                          child: Text(
                            "Turf",
                            style: gfontsubtitlefont(
                                cl: black, sz: 20, fw: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
