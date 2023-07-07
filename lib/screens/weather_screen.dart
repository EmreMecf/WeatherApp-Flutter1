import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprojects/weather_display_update.dart';

import '../providers/weather_provider.dart';
import 'loading_screen.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final weatherProvider = context.watch<WeatherProvider>();

    WeatherDisplayUpdate? weatherDisplayUpdate = weatherData().getWeatherData();
    Icon? weatherDisplayIcon = weatherData().getWeatherData()?.weatherIcon;

    if (weatherProvider.isLoading) {
      return const LoadingScreen();
    }

    if (weatherProvider.error != null) {
      return Center(
        child: Text(weatherProvider.error!),
      );
    }

    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: weatherDisplayUpdate!.weatherImage,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            child: weatherDisplayIcon,
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              '${weatherProvider.weatherResponse!.main!.temp?.round().toString()}°',
              style: const TextStyle(
                  color: Colors.white, fontSize: 55.0, letterSpacing: -6),
            ),
          ),
          Center(
            child: Text(
              weatherProvider.weatherResponse!.name.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 35.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
