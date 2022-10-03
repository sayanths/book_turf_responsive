import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:turf_book_second_project/app/mobile_layout/fullScreen/view/widgets/widgets.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';
import 'package:turf_book_second_project/app/utiles/colors.dart';
import 'package:turf_book_second_project/app/utiles/fonts.dart';
import 'package:turf_book_second_project/app/utiles/widgets.dart';

class FullScreenMobile extends StatefulWidget {
  final Datum data;
  const FullScreenMobile({super.key, required this.data});

  @override
  State<FullScreenMobile> createState() => _FullScreenMobileState();
}

class _FullScreenMobileState extends State<FullScreenMobile> {
  late TextEditingController _amountController;
  late Razorpay _razorpay;
  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSucess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          iconTheme: const IconThemeData(color: black),
        ),
        backgroundColor: white,
        body: Column(
          children: [
            FullScreenTitle(title: widget.data.turfName.toString()),
            Hero(
              // transitionOnUserGestures: true,
              tag: 'image1',
              child: Image.network(
                  widget.data.turfImages!.turfImages3.toString(),
                  height: size.height / 4,
                  width: size.width / 1.1,
                  fit: BoxFit.cover),
            ),
            height30,
            const FullScreenTitle(title: "Amenities"),
           

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                TimingWidget(
                  price: '800',
                  title: 'Morning',
                ),
                TimingWidget(
                  price: '1200',
                  title: 'AfterNoon',
                ),
                TimingWidget(
                  price: '1500',
                  title: 'Evening',
                ),
              ],
            ),
          ],
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
                          "Book Now",
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

class FullScreenTitle extends StatelessWidget {
  final String title;
  const FullScreenTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: gfontsubtitlefont(sz: 30),
          ),
        ],
      ),
    );
  }
}
