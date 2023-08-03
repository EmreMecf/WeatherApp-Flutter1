import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:testprojects/api/models/weather_model.dart';

const apiKey = "2ae60005a43a63ad4b4a55046bcf2664";

class WeatherApi {
  final Dio _dio;

  WeatherApi(this._dio);

  Future<WeatherResponse?> getCurrentTemperatureByLocation(
      Position position) async {
    final response = await _dio.get("weather", queryParameters: {
      "lat": position.latitude,
      "lon": position.longitude,
      "appid": apiKey,
      "units": "metric",
    });

    return WeatherResponse.fromJson(response.data);
  }

  Future<WeatherResponse?> getCurrentTemperatureByCityName(
      String cityName) async {
    final response = await _dio.get("weather", queryParameters: {
      "q": cityName,
      "appid": apiKey,
      "units": "metric",
    });
    return WeatherResponse.fromJson(response.data);
  }
}
