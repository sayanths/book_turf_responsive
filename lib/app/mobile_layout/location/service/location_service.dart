import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:turf_book_second_project/app/mobile_layout/location/model/location_model.dart';

class GetUserLoction extends GetxController {
  dynamic userDetails;
  Location? location;
  getUserLocation() async {
    print("sdsd");
    bool serviceEnabled;
    PermissionStatus permissionGrantend;

    serviceEnabled = await location!.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await location!.requestService();

       if (!serviceEnabled) {}
    }
    permissionGrantend = await location!.hasPermission();
    if (permissionGrantend == PermissionStatus.denied) {
      permissionGrantend = await location!.requestPermission();
      if (permissionGrantend != PermissionStatus.granted) {}
    }
    print("dsd");

    try {
      LocationData locationData = await location!.getLocation();

      double latitude = locationData.latitude!;
      double longitude = locationData.longitude!;
      log("response  lat: $latitude");
      log("response  lng: $longitude");
      var response = await Dio().get(
          "https://api.mapbox.com/geocoding/v5/mapbox.places/$longitude,$latitude.json?limit=1&types=place%2Cpostcode%2Clocality&access_token=pk.eyJ1IjoibXVzaHRoYWsiLCJhIjoiY2w5NXBzN3NwMDBpdTN1bXZqc2hkODF4MSJ9.TotadAOyJLd_fvnvLEI5tw");
      log(
        "response : ${response.data}",
      );
      log("sds");
      if (response.statusCode == 200) {
        final userData = UserLocationModel.fromJson(response.data);
        log(userData.features!.first.placeName!);

        userDetails = userData.features!.first.placeName;
        update();
      }
    } catch (e) {
      log("response  error : $e");
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getUserLocation();
  }
}
