import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier {
  bool isLoading = false;
  String? error;
  Position? position;

  Future getCurrentLocation() async {
    isLoading = true;
    notifyListeners();

    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      isLoading = false;
      throw error = "Location services are disabled.";
      notifyListeners();
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        isLoading = true;
        throw error = "Location permissions are denied";
        notifyListeners();
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      isLoading = false;
      throw error =
          "'Location permissions are permanently denied, we cannot request permissions.'";
      notifyListeners();
      return;
    }

    position = await Geolocator.getCurrentPosition();
    isLoading = false;
    error = null;
    notifyListeners();

    print(position);
  }
}
