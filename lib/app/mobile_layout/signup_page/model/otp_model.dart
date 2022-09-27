class OtpModel {
  int? otp;
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

  OtpResponse({this.status, this.message});

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      status: json["status"],
      message: json["message"],
    );
  }
}
