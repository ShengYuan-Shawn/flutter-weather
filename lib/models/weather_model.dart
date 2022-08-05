import 'dart:convert';

class WeatherModel {
  WeatherModel({
    required this.weather,
    required this.main,
    required this.id,
    required this.name,
    required this.cod,
  });

  final List<Weather> weather;
  final Main main;
  final int id;
  final String name;
  final int cod;

  factory WeatherModel.fromJson(String str) =>
      WeatherModel.fromMap(json.decode(str));

  factory WeatherModel.fromMap(Map<String, dynamic> json) => WeatherModel(
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
        main: Main.fromMap(json["main"]),
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
      );

  Map<String, dynamic> toMap() => {
        "weather": List<dynamic>.from(weather.map((x) => x.toMap())),
        "main": main.toMap(),
        "id": id,
        "name": name,
        "cod": cod,
      };
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  factory Main.fromJson(String str) => Main.fromMap(json.decode(str));

  factory Main.fromMap(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
      );

  Map<String, dynamic> toMap() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
      };
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final int id;
  final String main;
  final String description;
  final String icon;

  factory Weather.fromJson(String str) => Weather.fromMap(json.decode(str));

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}
