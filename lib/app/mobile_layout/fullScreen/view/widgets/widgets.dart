import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';

class FullViewCallAndChat extends StatelessWidget {
  final Function function;
  final String title;
  final IconData icon;
  final Color colorx;
  const FullViewCallAndChat({
    Key? key,
    required this.function,
    required this.title,
    required this.icon,
    required this.colorx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton.icon(
        onPressed: function(),
        icon: Icon(
          icon,
          color: white,
        ),
        label: Text(
          title,
          style: gfontsubtitlefont(cl: white),
        ),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
        ),
      ),
    );
  }
}

class FullScreenDetails extends StatelessWidget {
  final String title;
  final String icon;
  final String? policyUrl;
  final Color policyColor;

  const FullScreenDetails({
    Key? key,
    required this.title,
    required this.icon,
    this.policyUrl,
    required this.policyColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Iconify(
                  icon,
                  color: white,
                ),
              ),
              Text(
                title,
                style: gfontsubtitlefont(cl: white),
              ),
            ],
          ),
          Text(
            policyUrl ?? "",
            style: gfontsubtitlefont(cl: policyColor),
          ),
        ],
      ),
    );
  }
}

class FullScreenMainHeading extends StatelessWidget {
  final String title;
  const FullScreenMainHeading({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: gfontsubtitlefont(cl: white, sz: 25, fw: FontWeight.bold),
      ),
    );
  }
}
