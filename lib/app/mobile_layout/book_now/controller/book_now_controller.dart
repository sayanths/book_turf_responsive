import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookController extends GetxController {
  int selected = 0;

  Widget customRadio(String mainTile, String text, int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            mainTile,
            style: const TextStyle(
                color: Color.fromARGB(255, 0, 89, 162),
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
        ),
        OutlinedButton(
          onPressed: () {
            selected = index;
            update();
          },
          child: Row(
            children: [
              const Text(
                '₹',
                style: TextStyle(
                    color: Color.fromARGB(255, 2, 112, 33),
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              Text(
                text,
                style: TextStyle(
                    color: (selected == index)
                        ? const Color.fromARGB(255, 3, 201, 10)
                        : const Color.fromARGB(255, 148, 147, 147),
                    fontSize: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }

  
}
