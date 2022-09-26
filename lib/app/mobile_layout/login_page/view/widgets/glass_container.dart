import 'package:flutter/material.dart';

class LoginGlassContainer extends StatelessWidget {
  final Widget child;
  const LoginGlassContainer({
    Key? key,
    required this.size,
    required this.child,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 1.5,
      width: size.width / 1.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white10,
      ),
      child: child,
    );
  }
}