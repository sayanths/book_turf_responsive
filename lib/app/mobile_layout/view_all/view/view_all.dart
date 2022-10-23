import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/full_screen_title.dart';
import 'package:turf_book_second_project/app/mobile_layout/view_all/view/widget/choice_chip.dart';
import 'package:turf_book_second_project/app/mobile_layout/view_all/controller/view_all_controller.dart';
import 'package:turf_book_second_project/app/utiles/widgets.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            height10,
            Row(
              children: [
                IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back)),
                const FullScreenTitle(title: "Category", size: 25),
              ],
            ),
            height10,
            const ChoiceChipWidget(),
            LimitedBox(
              maxHeight: size.height,
              child: GetBuilder<ViewAllMobileController>(builder: (obj) {
                return GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: obj.allThings.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return obj.choiceListWidget[obj.defaultChoicIndex];
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
