import 'package:flutter/material.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';

class ProfileOrderList extends StatelessWidget {
  final Function function;
  final IconData icon;
  final String title;
  ProfileOrderList({
    Key? key,
    required this.function,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function(),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: gfontsubtitlefont(sz: 20, fw: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}

class Clipcliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.width);
    // path.quadraticBezierTo(
    //     size.width * 0.5, size.height * -100, size.width, size.height);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
