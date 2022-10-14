import 'package:flutter/material.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';

class Search extends StatelessWidget {
  const Search({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 18,
      width: size.width / 1.1,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 196, 196, 196),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'search..',
              hintStyle: TextStyle(color: black),
              suffixIcon: Icon(
                Icons.search,
                color: black,
              )),
        ),
      ),
    );
  }
}
