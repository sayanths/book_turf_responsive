import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignUpModel {
  String? email;
  String? password;

  SignUpModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        "user_mail": email,
        "user_password": password,
      };
}

class SignUpResponse {
  SignUpResponse({
    this.status,
    this.id,
    this.message,
  });

  bool? status;
  String? id;
  String? message;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        status: json["status"],
        id: json["id"],
        message: json["message"],
      );

  // Map<String, dynamic> toJson() => {
  //     "status": status,
  //     "id": id,
  //     "message": message,
  // };

}
