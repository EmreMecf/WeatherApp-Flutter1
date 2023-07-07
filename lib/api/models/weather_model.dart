import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherResponse {
  WeatherResponse({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Rain? rain;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  factory WeatherResponse.fromJson(Map<String, dynamic>? json) =>
      _$WeatherResponseFromJson(json!);

  Map<String, dynamic>? toJson() => _$WeatherResponseToJson(this);
}

@JsonSerializable()
class Clouds {
  Clouds({
    required this.all,
  });

  int? all;

  factory Clouds.fromJson(Map<String, dynamic>? json) =>
      _$CloudsFromJson(json!);

  Map<String, dynamic>? toJson() => _$CloudsToJson(this);
}

@JsonSerializable()
class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });

  double? lon;
  double? lat;

  factory Coord.fromJson(Map<String, dynamic>? json) => _$CoordFromJson(json!);

  Map<String, dynamic>? toJson() => _$CoordToJson(this);
}

@JsonSerializable()
class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  factory Main.fromJson(Map<String, dynamic>? json) => _$MainFromJson(json!);

  Map<String, dynamic>? toJson() => _$MainToJson(this);
}

@JsonSerializable()
class Rain {
  Rain({
    required this.the1H,
  });

  double? the1H;

  factory Rain.fromJson(Map<String, dynamic>? json) => _$RainFromJson(json!);

  Map<String, dynamic>? toJson() => _$RainToJson(this);
}

@JsonSerializable()
class Sys {
  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  factory Sys.fromJson(Map<String, dynamic>? json) => _$SysFromJson(json!);

  Map<String, dynamic>? toJson() => _$SysToJson(this);
}

@JsonSerializable()
class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  int? id;
  String? main;
  String? description;
  String? icon;

  factory Weather.fromJson(Map<String, dynamic>? json) =>
      _$WeatherFromJson(json!);

  Map<String, dynamic>? toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  double? speed;
  int? deg;
  double? gust;

  factory Wind.fromJson(Map<String, dynamic>? json) => _$WindFromJson(json!);

  Map<String, dynamic>? toJson() => _$WindToJson(this);
}
