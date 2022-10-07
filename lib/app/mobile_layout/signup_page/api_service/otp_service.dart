import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:turf_book_second_project/app/mobile_layout/signup_page/model/otp_model.dart';


class OtpVerifyApi {
  Future<OtpResponse?> verifyApi(OtpModel model) async {
    try {
      Response? response =
          await Dio().post("http://10.0.2.2:3000/account/verify-email-otp", data: model.toJson());

      if (response.statusCode == 200) {
        return OtpResponse.fromJson(response.data);
      }
    } on SocketException catch (e) {
      log(e.message.toString());
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
