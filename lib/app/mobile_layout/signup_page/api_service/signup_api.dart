import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:turf_book_second_project/app/mobile_layout/signup_page/model/sign_up_model.dart';
import 'package:turf_book_second_project/app/utiles/base_url.dart';

class SignUpApi {
  Future<SignUpResponse?> signUpUser(SignUpModel model) async {
    try {
      Response? response = await Dio().post(
          BaseUrl.signUp,
          data: model.toJson());

      if (response.statusCode == 200) {
        return SignUpResponse.fromJson(response.data);
      }
    } on SocketException catch (e) {
      log(e.message.toString());
    } catch (e) {
      log(e.toString());
      
    }
    return null;
 
  }
}
