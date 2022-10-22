import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:turf_book_second_project/app/mobile_layout/location/model/location_model.dart';

class GetUserLoction extends GetxController {
  GetUserLoction() {
    _location = Location();
  }

  dynamic userDetails;
  Location? _location;
  Location? get location => _location;
  getUserLocation() async {
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

    try {
      LocationData locationData = await location!.getLocation();

      double latitude = locationData.latitude!;
      double longitude = locationData.longitude!;
      log("response  lat: $latitude");
      log("response  lng: $longitude");
      var response = await Dio().get(
          "https://api.mapbox.com/geocoding/v5/mapbox.places/$longitude,$latitude.json?limit=1&types=place%2Cpostcode%2Clocality&access_token=pk.eyJ1Ijoic2F5YW50aGEiLCJhIjoiY2w5NzZ4a21sMTU2MTQxb3oydm9lNWp0ZiJ9.asxLqLDt_Q4jZbk9EInntQ");
      log(
        "response : ${response.data}",
      );
      if (response.statusCode == 200) {
        final userData = UserLocationModel.fromJson(response.data);
        log(userData.features!.first.placeName!);

        userDetails = userData.features!.first.placeName;
        update();
      }
    } catch (e) {
      log("response  error : $e");
    }
  }
}
