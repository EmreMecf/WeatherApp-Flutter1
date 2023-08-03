import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprojects/providers/currenttemp_provider.dart';
import 'package:testprojects/providers/location_provider.dart';
import 'package:testprojects/screens/loading_screen.dart';
import 'package:testprojects/screens/weather_screen.dart';

import '../locator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainScreenBody(),
    );
  }
}

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationProvider = context.watch<LocationProvider>();

    if (locationProvider.isLoading) {
      return const LoadingScreen();
    }

    if (locationProvider.error != null) {
      return Center(
        child: Text(locationProvider.error!),
      );
    }

    return ChangeNotifierProvider(
        create: (context) => locator<WeatherProvider>()
          ..getCurrentTemperatureByLocation(locationProvider.position!),
        child: const WeatherScreen());
  }
}
