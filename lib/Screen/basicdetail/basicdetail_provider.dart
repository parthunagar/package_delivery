import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BasicDetailProvider{
  Future<LatLng?> getLatLongFromAddress(String address) async {
    debugPrint('BasicDetailProvider => address : $address');
    try{
      List<Location> locations = await locationFromAddress(address);
      debugPrint('BasicDetailProvider => locations : $locations');
      debugPrint('BasicDetailProvider => locations[0] : ${locations[0]}');
      debugPrint('BasicDetailProvider => locations.first.latitude : ${locations.first.latitude}');
      debugPrint('BasicDetailProvider => locations.first.longitude : ${locations.first.longitude}');

      return LatLng(locations.first.latitude, locations.first.longitude);
    }catch(e){
      debugPrint('BasicDetailProvider => ERROR : $e');
      return null;
    }

  }
}