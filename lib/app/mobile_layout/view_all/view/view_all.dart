import 'package:carousel_slider/carousel_slider.dart';
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
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            height10,
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(color: Colors.amber),
                        child: Text(
                          'text $i',
                          style: const TextStyle(fontSize: 16.0),
                        ));
                  },
                );
              }).toList(),
            ),
            height30,
            const FullScreenTitle(title: "Category", size: 25),
            height10,
            const ChoiceChipWidget(),
            LimitedBox(
              maxHeight: 250,
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
