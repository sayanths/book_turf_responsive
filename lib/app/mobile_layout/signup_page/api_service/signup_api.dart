import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:turf_book_second_project/app/mobile_layout/signup_page/model/sign_up_model.dart';

class SignUpApi {
  Future<SignUpResponse?> signUpUser(SignUpModel model) async {
    try {
      Response? response = await Dio().post(
          "http://10.0.2.2:3000/account/signup-email",
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
