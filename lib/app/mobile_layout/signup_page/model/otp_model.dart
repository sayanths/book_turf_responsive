class OtpModel {
  OtpModel({
    this.userOtp,
    this.id,
  });

  String? userOtp;
  String? id;

  // factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
  //     userOtp: json["user_otp"],
  //     id: json["_id"],
  // );

  Map<String, dynamic> toJson() => {
        "user_otp": userOtp,
        "_id": id,
      };
}

// To parse this JSON data, do
//
//     final otpResponse = otpResponseFromJson(jsonString);

class OtpResponse {
  OtpResponse({
    this.status,
    this.message,
    this.token,
    this.refreshToken,
    this.id,
  });

  bool? status;
  String? message;
  String? token;
  String? refreshToken;
  String? id;

  factory OtpResponse.fromJson(Map<String, dynamic> json) => OtpResponse(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        refreshToken: json["refreshToken"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
        "refreshToken": refreshToken,
        "_id": id,
      };
}
