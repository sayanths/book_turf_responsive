import 'package:flutter/material.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';

class CustomTextField extends StatelessWidget {
  final double width;
  final TextInputType keyboard;
  final IconData icon;
  final String title;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final bool obsureText;
  const CustomTextField({
    Key? key,
    required this.size,
    required this.icon,
    required this.title,
    required this.keyboard,
    this.controller,
    this.validate,
    required this.obsureText,
    required this.width,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        children: [
          Expanded(
            child: CustomLoginContainer(
              size: size,
              icon: icon,
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              height: size.height / 13,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: obsureText,
                  validator: validate,
                  controller: controller,
                  keyboardType: keyboard,
                  decoration: InputDecoration(
                    hintText: title,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomLoginContainer extends StatelessWidget {
  final IconData icon;
  const CustomLoginContainer({
    Key? key,
    required this.size,
    required this.icon,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
     
      height: size.height / 13,
      decoration: const BoxDecoration(
        color: black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Icon(
        icon,
        color: white,
      ),
    );
  }
}
