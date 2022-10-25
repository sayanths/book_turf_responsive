import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/model/booking_model.dart';

class BookingService {
  Future<BookingModel?> getTurfData(String id) async {
    log(id);
    try {
      final response = await Dio()
          .get("https://fauxspot.herokuapp.com/account/get-booking/$id");
      if (response.statusCode == 200) {
        log(response.data.toString());
        return BookingModel.fromJson(response.data);
      }
    }
    //  on DioError catch (e) {
    //   log("dio error");
    // }
    catch (e) {
      log(e.toString());
    }

    return null;
  }
}
