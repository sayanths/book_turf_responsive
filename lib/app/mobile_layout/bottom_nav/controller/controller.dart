import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/favourite/view/bottom_nav.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/view/home_page.dart';
import 'package:turf_book_second_project/app/mobile_layout/notification/controller/controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/notification/view/bottom_nav.dart';
import 'package:turf_book_second_project/app/mobile_layout/profile/view/bottom_nav.dart';

class BottomNNavController extends GetxController {

   int pageIndex = 0;
  onClick(int updatedPageIndex) {
    pageIndex = updatedPageIndex;
    update();
  }

  final pages = [
    HomePageMobile(),
    FavouritePageMobile(),
    NotificationMobile(),
    ProfilePageMobile(),
  ];
}
