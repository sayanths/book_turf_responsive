import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:turf_book_second_project/app/mobile_layout/login_page/model/login_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/signup_page/model/otp_model.dart';
import 'package:turf_book_second_project/app/utiles/base_url.dart';

class HelperIntercepter {
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  Future<Dio> getApiClient() async {
    Dio dio = Dio();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      final token = await getToken();

      dio.interceptors.clear();
      print('token is$token');

      options.headers.addAll({
        "Authorization": "Bearer $token",
      });
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (e, handler) async {
      if (e.response?.statusCode == 403) {
        final refreshToken = await getRefreshToken();

        try {
          await dio.post(BaseUrl.newToken, data: {
            "refresh": refreshToken,
          }).then((value) async {
            if (value.statusCode == 200) {
              print("ds");
              final obj = OtpResponse.fromJson(value.data);
              await addToSecureStorage(value.data['token']);
              //set bearer
              e.requestOptions.headers.addAll({
                "Authorization": "${obj.token}",
              });
              //create request with new access token
              final opts = Options(
                  method: e.requestOptions.method,
                  headers: e.requestOptions.headers);
              final cloneReq = await dio.request(e.requestOptions.path,
                  options: opts,
                  data: e.requestOptions.data,
                  queryParameters: e.requestOptions.queryParameters);

              return handler.resolve(cloneReq);
            }
            return handler.next(e);
          });
        } catch (e) {
          log(e.toString());
        }
      }
    }));
    return dio;
  }

   addToSecureStorage(LoginResponse value) async {
    await secureStorage.write(
      key: "token",
      value: value.token,
    );
    log('added to secure storage');
  }

  Future<String> getToken() async {
    return await secureStorage.read(key: "token") ?? "";
   }

  Future<String> getRefreshToken() async {
    return await secureStorage.read(key: "refreshToken") ?? "";
  }
}

