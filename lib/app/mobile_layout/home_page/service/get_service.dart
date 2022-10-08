import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';
import 'package:turf_book_second_project/app/utiles/base_url.dart';

class GetApiService {
  final dio = Dio(BaseOptions(baseUrl: BaseUrl.url));
  Future<VendorModel?> getTurfData() async {
    try {
      final response =
          await dio.get("https://fauxspot.herokuapp.com/user/all-turf");
      if (response.statusCode == 200) {
        return VendorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log(e.response!.data.toString());
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
