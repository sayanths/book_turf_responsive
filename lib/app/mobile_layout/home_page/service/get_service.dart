import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/intersecptor/view/intersecptor.dart';
import 'package:turf_book_second_project/app/utiles/base_url.dart';

class GetApiService {
  // final dio = Dio(BaseOptions(baseUrl: BaseUrl.url));
  Future<VendorModel?> getTurfData() async {
    try {
      Dio dio = await HelperIntercepter().getApiClient();
      final response = await dio.get(BaseUrl.fetchData);
      if (response.statusCode == 200) {
        log(response.data.toString());
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
