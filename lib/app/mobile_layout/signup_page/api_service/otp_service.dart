import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:turf_book_second_project/app/mobile_layout/signup_page/model/otp_model.dart';
import 'package:turf_book_second_project/app/utiles/base_url.dart';

class OtpVerifyApi {
  Future<OtpResponse?> verifyApi(OtpModel model) async {
    log(model.toJson().toString());
    try {
      Response? response = await Dio().post(
        BaseUrl.otp,
        data: model.toJson(),
      );

      if (response.statusCode == 200) {
        log("200");
        log(response.data["message"]);
        return OtpResponse.fromJson(response.data);
      }
    } on SocketException catch (e) {
      log(e.message.toString());
    } catch (e) {
      OtpResponse(message: 'Verification failed');
    }
    return null;
  }
}
