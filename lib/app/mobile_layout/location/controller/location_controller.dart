// import 'dart:async';


// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';

// class LocationController extends GetxController {
//   var latitude = 'Getting latitude'.obs;
//   var longitude = 'Getting longitude'.obs;
//   var address = 'Getting Address..'.obs;
//   late StreamSubscription<Position> streamSubscription;

//   getLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       await Geolocator.openLocationSettings();
//       return Future.error('Location service disabled');
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error('Location service denied');
//     }
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error('LOcation permission ,denined permentantly');
//     }

//     //with this we can retrive the location continously
//     streamSubscription =
//         Geolocator.getPositionStream().listen((Position position) {
//       latitude.value = 'latitude :${position.latitude}';
//       longitude.value = 'longitude :${position.longitude}';
//       getaddressFromLang(position);
//     });
//     update();
//   }

//   Future<void> getaddressFromLang(Position position) async {
//     List<Placemark> placeMark =
//         await placemarkFromCoordinates(position.latitude, position.longitude);
//     Placemark place = placeMark[0];
//     address.value = 'Address ${place.locality}, ${place.street}';
//   }

//   @override
//   void onInit() async {
//     super.onInit();
//     getLocation();
//   }

//   @override
//   void onClose() {
//     super.onClose();
//     streamSubscription.cancel();
//   }


// }
