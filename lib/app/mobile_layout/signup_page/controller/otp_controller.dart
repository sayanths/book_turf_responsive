import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_book_second_project/app/mobile_layout/bottom_nav/view/bottom_nav.dart';
import 'package:turf_book_second_project/app/mobile_layout/signup_page/api_service/otp_service.dart';
import 'package:turf_book_second_project/app/mobile_layout/signup_page/model/otp_model.dart';

class OptController extends GetxController {
  final otp1 = TextEditingController();
  final otp2 = TextEditingController();
  final otp3 = TextEditingController();
  final otp4 = TextEditingController();
  GlobalKey otpKey = GlobalKey<FormState>();
  bool isloading = false;
  otpData() async {
    final otp = {otp1.text + otp2.text + otp3.text + otp4.text};
    final otpJoin = otp.join();

    final result = OtpModel(
      otp: otpJoin,
    );
    isloading = true;
    update();

    OtpResponse? response = await OtpVerifyApi().verifyApi(result);

    if (response != null) {
      
      OtpResponse(message: "sucess");
      
      if (response.status!) {
      await saveUserData();
        Get.offAll(() => const BottomNavigationMobile());
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    otp1.dispose();
    otp2.dispose();
    otp3.dispose();
    otp4.dispose();
  }

  saveUserData() async {
    final obj = await SharedPreferences.getInstance();
    obj.setBool('userLoged', true);
  }
}
