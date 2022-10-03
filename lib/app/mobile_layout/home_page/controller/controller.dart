import 'package:get/get.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/model/product_model.dart';
import 'package:turf_book_second_project/app/mobile_layout/home_page/service/get_service.dart';

class HomePageControllerMobile extends GetxController {
  RxBool isFavourite = false.obs;
  List<Datum> vendorTurfList = [];

  fetchDetails() async {
    VendorModel? response = await GetApiService().getTurfData();
    if (response != null) {
      if (response.status!) {
        vendorTurfList.clear();
        vendorTurfList.addAll(response.data);
      }
    }
    update();
  }

  @override
  void onInit() {
    fetchDetails();
    super.onInit();
  }
}
