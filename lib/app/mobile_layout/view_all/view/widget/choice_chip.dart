import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/view_all/controller/view_all_controller.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';

class ChoiceChipWidget extends StatelessWidget {
  const ChoiceChipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cntrlGet = Get.put(ViewAllMobileController());
    return Wrap(
      spacing: 10,
      children: List.generate(cntrlGet.choiceList.length, (index) {
        return GetBuilder<ViewAllMobileController>(
          builder: (obj) {
            return ChoiceChip(
              label: Text(
                obj.choiceList[index],
                style: TextStyle(
                    color: obj.defaultChoicIndex == index
                        ? black
                        : const Color.fromARGB(255, 0, 146, 5)),
              ),
              selected: obj.defaultChoicIndex == index ? true : false,
              backgroundColor: obj.defaultChoicIndex == index
                  ? const Color.fromARGB(255, 5, 109, 0)
                  : white,
              onSelected: (value) {
                obj.choiceChipOnPress(value, index);
              },
              elevation: 15,
            );
          },
        );
      }),
    );
  }
}
