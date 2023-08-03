import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:testprojects/api/weather_api.dart';
import 'package:testprojects/providers/currenttemp_provider.dart';
import 'package:testprojects/providers/location_provider.dart';

final locator = GetIt.instance;

initLocator() {
  final dio = Dio();
  dio.options.baseUrl = "https://api.openweathermap.org/data/2.5/";

  locator.registerLazySingleton(() => WeatherApi(dio));
  locator.registerFactory(() => LocationProvider());
  locator.registerFactory(() => WeatherProvider(locator()));
}
