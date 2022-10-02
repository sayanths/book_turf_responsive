import 'package:flutter/material.dart';
import 'package:turf_book_second_project/app/mobile_layout/favourite/view/widget/gird_view.dart';
import 'package:turf_book_second_project/app/mobile_layout/favourite/view/widget/heading_navbar_screen.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';


class FavouritePageMobile extends StatelessWidget {
  const FavouritePageMobile({Key? key}) : super(key: key);

  @override
   Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: black,
        body:  SingleChildScrollView(
            child: Column(
              children: [
                HeadingsInNavBarScreen(title: "Favourite"),
                LimitedBox(
                 maxHeight: 900,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 3,
                              crossAxisSpacing: 25,
                              mainAxisSpacing: 25),
                      itemCount: 10,
                      itemBuilder: (BuildContext ctx, index) {
                        return ViewAllGridView();
                      }),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
