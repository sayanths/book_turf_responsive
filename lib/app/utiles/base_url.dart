class BaseUrl {
  static const String url = 'https://majestic-turf.herokuapp.com';
  static const String login = '$url/account/login-email';
  static const String signUp = '$url/account/signup-email';
  static const String otp = '$url/account/verify-email-otp';
  static const String fetchData = '$url/user/all-turf';
  static const String newToken = '$url/account/refresh-token';

  static const String getWishlist = "/user/get-whishlist/{id}";
  static const String addWishlist = "http://10.0.2.2:3000/user/add-whishlist";
}
