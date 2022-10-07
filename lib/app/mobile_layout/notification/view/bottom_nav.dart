import 'package:flutter/material.dart';
import 'package:turf_book_second_project/app/mobile_layout/favourite/view/widget/heading_navbar_screen.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';

class NotificationMobile extends StatelessWidget {
  const NotificationMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HeadingsInNavBarScreen(title: 'Notification'),
              LimitedBox(
                maxHeight: size.height,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 5,
                      color: white,
                    );
                  },
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Image.network(
                          "https://res.cloudinary.com/sayanth/image/upload/v1662206280/zara%27s%20shopping%20app/zara%20shopping/notifcation_udbmy3.png"),
                      title: Text(
                        "Onam Special Offer",
                        style: gfontsubtitlefont(
                            cl: const Color.fromARGB(255, 4, 213, 11),
                            fw: FontWeight.w400,
                            sz: 20),
                      ),
                      subtitle: Text(
                        "30 % off for all vechile for which rent is more than 3000.",
                        style: Lato(cl: white, fw: FontWeight.normal, sz: 15),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
