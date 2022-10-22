import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/book_now_controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';

class TimingBooking extends GetxController {
  final data = Datum();

  final dat = Get.find<BookController>();

  List timeBookedListMorning = [];
  List timeBookedListafterNoon = [];
  List timeBookedListevening = [];
  List morningtiming = [
    '6:00  -  7:00',
    '7:00  -  8:00',
    '8:00  -  9:00',
    '9:00  -  10:00',
    '10:00 -  11:00',
    '11:00 -  12:00',
  ];

  List afterNoontiming = [
    '1:00  -  2:00',
    '2:00  -  3:00',
    '3:00  -  4:00',
    '4:00  -  6:00',
  ];

  List eveningtiming = [
    '7:00  -  8:00',
    '8:00  -  9:00',
    '9:00  -  10:00',
    '10:00 -  11:00',
    '11:00 -  12:00',
    '1:00  -  2:00',
    '2:00  -  3:00',
  ];
}
