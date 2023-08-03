import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprojects/api/models/weather_model.dart';
import 'package:testprojects/weather_display_update.dart';
import 'package:testprojects/widgets/search_button.dart';

import '../providers/currenttemp_provider.dart';
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

    return Scaffold(
      floatingActionButton: SearchFloatingButton(onSearch: (result) {
        if (result != null) {
          weatherProvider.getCurrentTemperatureByCityName(result);
        }
      }),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: weatherDisplayUpdate!.weatherImage,
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            WeatherCity(weatherResponse: weatherProvider.weatherResponse!),
            const SizedBox(
              height: 35,
            ),
            Container(
              child: weatherDisplayIcon,
            ),
            const SizedBox(
              height: 25,
            ),
            WeatherInfo(weatherResponse: weatherProvider.weatherResponse!),
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherInfo extends StatelessWidget {
  final WeatherResponse weatherResponse;

  const WeatherInfo({Key? key, required this.weatherResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(
                  color: const ColorScheme.light().secondary,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xff5ad9d3).withOpacity(0.3)),
            child: Column(
              children: [
                Text(
                  '${weatherResponse.main!.temp?.round().toString()}°',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 55.0,
                      letterSpacing: -6),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class WeatherCity extends StatelessWidget {
  final WeatherResponse weatherResponse;

  const WeatherCity({Key? key, required this.weatherResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.near_me,
            size: 20,
            color: Colors.white,
          ),
          const SizedBox(
            width: 12,
          ),
          Center(
            child: Text(
              '${weatherResponse.name?.toString()}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
