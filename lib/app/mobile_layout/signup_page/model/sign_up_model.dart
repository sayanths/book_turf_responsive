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
  bool? status;
  int? id;

  SignUpResponse({
    this.status,
    this.id,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      status: json["status"],
      id: json["id"],
    );
  }
}
