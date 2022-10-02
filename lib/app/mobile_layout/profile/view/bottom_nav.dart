import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:turf_book_second_project/app/mobile_layout/profile/view/widgets/product_list.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';
import 'package:turf_book_second_project/app/utiles/widgets.dart';

class ProfilePageMobile extends StatelessWidget {
  const ProfilePageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 6, 1, 57),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.bottomCenter,
              begin: Alignment.topLeft,
              colors: [
                Color.fromARGB(255, 0, 111, 4),
                Color.fromARGB(255, 5, 141, 0),
                Color.fromARGB(255, 0, 96, 3),
              ],
            ),
          ),
          child: ListView(
            children: [
              height10,
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.transparent,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.settings,
                          color: white,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "sayanth A",
                              style: gfontsubtitlefont(cl: white, sz: 30),
                            ),
                            height10,
                            height10,
                            Text(
                              "+91 9846401321",
                              style: gfontsubtitlefont(cl: white, sz: 20),
                            )
                          ],
                        ),
                        const CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Pierre-Person.jpg/682px-Pierre-Person.jpg"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ClipPath(
                clipper: Clipcliper(),
                child: Container(
                  height: size.height / 4,
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: white,
                  ),
                ),
              ),
              Container(
                height: size.height / 3,
                decoration: const BoxDecoration(
                  color: white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      ProfileOrderList(
                          function: () {},
                          icon: Icons.category,
                          title: 'My orders'),
                      height30,
                      ProfileOrderList(
                        function: () {},
                        icon: Icons.support,
                        title: ' Support',
                      ),
                      height30,
                      ProfileOrderList(
                          function: () {},
                          icon: Icons.person,
                          title: 'Be a seller'),
                      height30,
                      ProfileOrderList(
                          function: () {}, icon: Icons.home, title: 'About us'),
                      height10,
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.logout),
                        label: const Text(
                          "Log out",
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: darkBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
