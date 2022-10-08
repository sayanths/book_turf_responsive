import 'package:flutter/material.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';

class YogaCategory extends StatelessWidget {
  const YogaCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height / 3.6,
          width: size.width / 2,
          decoration: BoxDecoration(
            color: Colors.white10,
            image: const DecorationImage(
              image: NetworkImage(
                "https://5.imimg.com/data5/GM/RQ/HO/SELLER-72580573/gettyimages-553001229-58e833c33df78c5162e5c2e5-500x500.jpg",
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
                        color: Color.fromARGB(255, 228, 228, 228),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                      ),
                      child: Center(
                        child: Text(
                          'Turf 3',
                          style: gfontsubtitlefont(
                              cl: black, sz: 20, fw: FontWeight.bold),
                          textAlign: TextAlign.center,
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
    );
  }
}
