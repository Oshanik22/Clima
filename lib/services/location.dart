import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  double latitude;
  double longitude;


  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
      latitude =  position.latitude;
      longitude = position.longitude;

    } catch (e) {
      print(e);
      print('ho ho ho, exception occured muchachos');
    }
  }
}
