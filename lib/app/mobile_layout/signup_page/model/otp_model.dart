class OtpModel {
  String? otp;
  int? id;

  OtpModel({
    this.id,
    this.otp,
  });

  Map<String, dynamic> toJson() => {
        "user_otp": otp,
        "_id": id,
      };
}

class OtpResponse {
  bool? status;
  String? message;
  String? token;
  String? refreshToken;

  OtpResponse({this.status, this.message, this.token, this.refreshToken});

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      status: json["status"],
      message: json["message"],
      token: json['token'],
      refreshToken: json['refreshToken'],
    );
  }
}
