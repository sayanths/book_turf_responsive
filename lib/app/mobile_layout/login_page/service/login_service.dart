import 'dart:async';

import 'package:dio/dio.dart';
import 'package:turf_book_second_project/app/mobile_layout/intersecptor/view/intersecptor.dart';
import 'package:turf_book_second_project/app/mobile_layout/login_page/model/login_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/server/error.dart';
import 'package:turf_book_second_project/app/utiles/base_url.dart';

class Api {
  // final dio = Dio(BaseOptions(baseUrl: BaseUrl.url));

  Future<LoginResponse?> loginUser(LoginModel model) async {
    Dio dio = await HelperIntercepter().getApiClient();
    bool network = await checking();

    if (network) {
      try {
        final response = await dio.post(BaseUrl.login, data: model.toJson());
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return LoginResponse.fromJson(response.data);
        }
      } catch (e) {
        return LoginResponse(message: handleError(e));
      }
    } else {
      return LoginResponse(message: 'Please check your internet');
    }
    return null;
  }
}
