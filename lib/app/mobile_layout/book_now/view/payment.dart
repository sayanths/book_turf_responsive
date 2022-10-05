import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/widgets.dart';
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
  late Razorpay _razorpay;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSucess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TimingWidget(
                  price: widget.data.turfTime!.timeMorning.toString(),
                  title: 'Morning',
                ),
                TimingWidget(
                  price: widget.data.turfTime!.timeAfternoon.toString(),
                  title: 'AfterNoon',
                ),
                TimingWidget(
                  price: widget.data.turfTime!.timeEvening.toString(),
                  title: 'Evening',
                ),
              ],
            ),
            height30,
            Row(
              children: [
                DropdownButton<String>(
                  hint: const Text('1400'),
                  items: <String>[
                    '800',
                    '1200',
                    '1400',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
              ],
            ),
            // Container(
            //   height: 60,
            //   width: 60,
            //   color: red,
            // ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: Container(
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  border: Border.all(color: grey, width: 1),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      height: 50,
                      width: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: const [
                          Text('oct'),
                          Text('5'),
                          Text('THU'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
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
