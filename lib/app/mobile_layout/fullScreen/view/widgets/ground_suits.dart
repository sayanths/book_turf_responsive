import 'package:flutter/material.dart';

class GroundSuitWidget extends StatelessWidget {
  final Widget child;
  const GroundSuitWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      width: 50,
      child: child,
    );
  }
}

class GroundSuitsWidget extends StatelessWidget {
  final Widget icon;
  const GroundSuitsWidget({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 194, 222, 244),
            borderRadius: BorderRadius.circular(5)),
        child: icon);
  }
}
