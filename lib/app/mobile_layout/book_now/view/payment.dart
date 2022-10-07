import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/controller/book_now_controller.dart';
import 'package:turf_book_second_project/app/mobile_layout/book_now/view/widgets/custom_back_button.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/full_screen_title.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';
import 'package:turf_book_second_project/app/utiles/widgets.dart';

class BookNow extends StatefulWidget {
  final Datum data;
  const BookNow({
    super.key,
    required this.data,
  });

  @override
  State<BookNow> createState() => _BookNowState();
}

class _BookNowState extends State<BookNow> {
  //int selected = 0;
  late Razorpay _razorpay;
  @override
  void initState() {
    super.initState();

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSucess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    final bookContrlNow = Get.put(BookController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Align(
                alignment: Alignment.topLeft, child: CustomBackButton()),
            height30,
            GetBuilder<BookController>(
              builder: (controller) {
                return Column(
                  children: [
                    const FullScreenTitle(title: "Select Price", size: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        controller.customRadio("Morning",
                            widget.data.turfTime!.timeMorning.toString(), 1),
                        controller.customRadio("Afternoon",
                            widget.data.turfTime!.timeAfternoon.toString(), 2),
                        controller.customRadio("Evening",
                            widget.data.turfTime!.timeEvening.toString(), 3),
                      ],
                    ),
                    height30,
                    const FullScreenTitle(title: "Select day", size: 25),
                    height10,
                    ElevatedButton(
                      onPressed: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now());
                      },
                      child: Text("Pick Date"),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height / 10,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 2, 171, 8),
              Color.fromARGB(255, 0, 96, 3),
              Color.fromARGB(255, 2, 171, 8),
            ],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            height10,
            height10,
            InkWell(
              onTap: () {
                var options = {
                  "key": "rzp_test_g9wjrkJkmYw27N",
                  // "amount": num.parse(_amountController.text) * 100,
                  "name": "new project",
                  "description": "payment for our work",
                  "prefill": {
                    "contact": "7055451245",
                    "email": "mveli620@gmail.com"
                  },
                  "external": {
                    "wallets": ["paytm"]
                  }
                };
                try {
                  _razorpay.open(options);
                } catch (e) {
                  print(e.toString());
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: size.height / 20,
                    width: size.width / 1.9,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Proceed to pay",
                        style: gfontsubtitlefont(
                          cl: white,
                          fw: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handlePaymentSucess() {
    print("Payment Sucess");
  }

  handlePaymentError() {
    print("Payment Failed");
  }

  handleExternalWallet() {
    print("external  wallet");
  }
}
