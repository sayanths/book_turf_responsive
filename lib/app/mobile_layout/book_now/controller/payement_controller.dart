import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {
  bool payment = false;

  late Razorpay _razorpay;
  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSucess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSucess() {
    Get.snackbar('payement Sucessfull', '');
  }

  _handlePaymentError() {
    Get.snackbar("Payment Failed", '');
  }

  _handleExternalWallet() {
    Get.snackbar('external  wallet', '');
  }

  option() {
    var options = {
      "key": "rzp_test_g9wjrkJkmYw27N",
      // "amount": num.parse(_amountController.text) * 100,
      "name": "new project",
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
    Map<String, dynamic> data = {
      "isBooked": true,
      "user_id": "987488222444444",
      "book_date": DateTime.now().toIso8601String()
    };
    var response =
        await Dio().post("http://10.0.2.2:3000/turf/booking", data: data);
    if (response.statusCode == 200) {
      Get.snackbar('', 'Payemnt sucessfull');
    }
  }
}
