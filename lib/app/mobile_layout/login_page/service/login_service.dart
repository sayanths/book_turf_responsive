import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:turf_book_second_project/app/mobile_layout/login_page/model/login_model.dart';
import 'package:turf_book_second_project/app/utiles/base_url.dart';

class Api {
  final dio = Dio(BaseOptions(baseUrl: BaseUrl.url));

  Future<LoginResponse?> loginUser(LoginModel model) async {
    try {
      // await check internet is offline or online
      final response = await dio.post(BaseUrl.login, data: model.toJson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.toString());
        return LoginResponse.fromJson(response.data);
      } else {
        return LoginResponse(message: "somthing went wrong");
      }
    } on TimeoutException catch (e) {
      debugPrint(e.toString());
    } on SocketException catch (e) {
      return LoginResponse(message: e.toString());
    } catch (e) {
      return LoginResponse(message: e.toString());
    }
    return null;
  }
}
