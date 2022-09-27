import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:turf_book_second_project/app/mobile_layout/login_page/model/login_model.dart';
import 'package:turf_book_second_project/app/utiles/base_url.dart';

class Api {
  final dio = Dio(BaseOptions(baseUrl: BaseUrl.url));

  Future<LoginResponse?> loginUser(LoginModel model) async {
    try {
      // await check internet is offline or online
      final response = await dio.post(BaseUrl.login, data: model.toJson());
      if (response.statusCode == 200) {
        log(response.toString());
        return LoginResponse.fromJson(response.data);
      } else {
        return LoginResponse(message: "somthing went wrong");
      }
    } on SocketException catch (e) {
      return LoginResponse(message: e.toString());
    } catch (e) {
      log(e.toString());
      // if (e is DioError) {
      //   if (e.response?.data == null) {
      //     return
      //   }
      // }
    }
    return null;
  }
}
