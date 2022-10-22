import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/fullscreen.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/controller/controller.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/widgets.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: GetBuilder<HomePageControllerMobile>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 0, 63, 2),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: white,
                        ),
                      ),
                      Form(
                        key: controller.searchKey,
                        child: Expanded(
                          child: CupertinoSearchTextField(
                              style: const TextStyle(color: white),
                              controller: controller.searchController,
                              onChanged: (value) {
                                controller.runFilter(value);
                              },
                              prefixIcon: const Icon(
                                Icons.search,
                                color: white,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                height10,
                height10,
                Expanded(
                  child: controller.searchResult.isEmpty
                      ? const Center(
                          child: Text("Search for turf"),
                        )
                      : ListView.builder(
                          itemCount: controller.filteredData.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final searchTurf = controller.filteredData[index];
                            return InkWell(
                              onTap: () {
                                Get.to(
                                    () => FullScreenMobile(data: searchTurf));
                              },
                              child: ListTile(
                                title: Text(searchTurf.turfName!),
                                subtitle: Text(searchTurf.turfPlace!.toString()),
                                leading: Image.network(
                                  searchTurf.turfImages!.turfImages1!,
                                  height: 40,
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color:
                                            searchTurf.turfInfo!.turfIsAvailable!
                                                ? const Color.fromARGB(
                                                    255, 3, 199, 10)
                                                : Colors.red,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
