import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherDisplayUpdate {
  late Icon weatherIcon;
  late AssetImage weatherImage;

  WeatherDisplayUpdate({required this.weatherIcon, required this.weatherImage});
}

class weatherData {
  WeatherDisplayUpdate? getWeatherData() {
    var dt = DateTime.now();
    if (dt.hour >= 20) {
      return WeatherDisplayUpdate(
          weatherIcon: const Icon(
            FontAwesomeIcons.moon,
            size: 90,
            color: Colors.amber,
          ),
          weatherImage: AssetImage('assest/gece.png'));
    } else {
      return WeatherDisplayUpdate(
          weatherIcon: const Icon(
            FontAwesomeIcons.sun,
            size: 90,
            color: Colors.lime,
          ),
          weatherImage: AssetImage('assest/sunny.png'));
    }
  }
}
