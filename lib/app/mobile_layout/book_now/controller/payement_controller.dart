import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/model/booking_addpost_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view_model/view_model_controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/view/home_page.dart';


class PaymentController extends GetxController {
  bool payment = false;

  late Razorpay _razorpay;
  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    addBooking();
    Get.to(() => const HomePageMobile());
    
  }

  _handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar("Payment Failed", '');
  }

  _handleExternalWallet(ExternalWalletResponse response) {
    Get.snackbar('external  wallet', '');
  }

  late BookingPostModel data;
  option(BookingPostModel data) {
    this.data = data;
    var options = {
      "key": "rzp_test_g9wjrkJkmYw27N",
      "amount": Get.put(ViewFullScreen()).totalAmount * 100,
      "name": "Majestic Turf",
      "description": "payment for our work",
      "prefill": {"contact": "7055451245", "email": "mveli620@gmail.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void addBooking() async {
    try {
      var response = await Dio().post(
          "https://fauxspot.herokuapp.com/account/add-booking",
          data: data.toJson());
      if (response.statusCode == 200) {
        log(response.data.toString());
        Get.snackbar('', 'Payemnt sucessfull');
      }
    } catch (e) {
      Get.snackbar('', e.toString());
    }
  }
}
