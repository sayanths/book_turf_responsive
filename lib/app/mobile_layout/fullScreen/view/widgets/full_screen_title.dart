import 'package:flutter/material.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';

class FullScreenTitle extends StatelessWidget {
  final double size;
  final String title;
  const FullScreenTitle({
    Key? key,
    required this.title,
    required this.size,
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
            style: gfontsubtitlefont(sz: size),
          ),
        ],
      ),
    );
  }
}
