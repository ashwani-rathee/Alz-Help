// import 'dart:async';

// import 'package:alzhelp/models/userLoc.dart';
// import 'package:location/location.dart';
// import 'package:geocoder/geocoder.dart';
// import 'package:flutter/services.dart';

// getUserLocation() async {
//   //call this async method from whereever you need
//   dynamic currentLocation;
//   LocationData myLocation;
//   String error;
//   Location location = new Location();
//   try {
//     myLocation = await location.getLocation();
//   } on PlatformException catch (e) {
//     if (e.code == 'PERMISSION_DENIED') {
//       error = 'please grant permission';
//       print(error);
//     }
//     if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
//       error = 'permission denied- please enable it from app settings';
//       print(error);
//     }
//     myLocation = null;
//   }
//   currentLocation = myLocation;
//   final coordinates = new Coordinates(myLocation.latitude, myLocation.longitude);
//   var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
//   var first = addresses.first;
//   print(
//       ' ${first.countryName}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
//   return first;
// }

// class Locations {
//   dynamic location;

//   Future<UserLoc> funct() async {
//     try {
//       var loc = await getUserLocation();
//       location = UserLoc(location: loc);
//     } catch (e) {
//       print(e);
//     }
//     return location;
//   }

//   Stream<UserLoc> get user {
//     return funct().asStream();
//   }
// }
