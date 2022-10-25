import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/model/booking_model.dart';

class GetApiService {
  Future<BookingModel?> getTurfData() async {
    try {
      final response = await Dio().get(
          "https://fauxspot.herokuapp.com/account/get-booking/6351344f7e688d3e90aa1bf9");
      if (response.statusCode == 200) {
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
