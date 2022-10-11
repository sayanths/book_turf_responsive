import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final Widget child;
  const CustomBottomBar({
    Key? key,
    required this.size,
    required this.child,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 10,
      width: size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 2, 171, 8),
            Color.fromARGB(255, 0, 96, 3),
            Color.fromARGB(255, 2, 171, 8),
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}
