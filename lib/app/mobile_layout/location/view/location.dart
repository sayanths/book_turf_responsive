// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:iconify_flutter/iconify_flutter.dart';
// import 'package:iconify_flutter/icons/carbon.dart';
// import 'package:turf_book_second_project/app/utiles/colors.dart';
// import 'package:turf_book_second_project/app/utiles/fonts.dart';

// class CurrentLocation extends StatefulWidget {
//   const CurrentLocation({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<CurrentLocation> createState() => _CurrentLocationState();
// }

// class _CurrentLocationState extends State<CurrentLocation> {
//   String currentAddress = 'calicut,Kerala,India'; //address name will return
//   late Position currentPosition; //return the latitude and longitude

//   Future<Position> determinePosition() async {
//     Bool serviceEnabled;
//     LocationPermission permission;
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       Get.snackbar('internet', 'keep your location on');
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//        if (permission == LocationPermission.denied) {
//       Get.snackbar('Denied', 'Location permission is denied');
//     }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Row(
//         children: [
//           const Iconify(
//             Carbon.location_current,
//             color: black,
//           ),
//           Text(
//             currentAddress,
//             style: Lato(cl: black),
//           ),
//         ],
//       ),
//     );
//   }
// }
