import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class Data {
  final dateProvider = StateProvider((ref) => dataIwant());

  static String dataIwant() {
    final year = DateTime.now().year;
    final mounth = DateTime.now().month;
    final day = DateTime.now().day;

    final result = '$year / $mounth / $day ';
    return result;
  }
}

//// ************************************************************************* ////

class ApiTrying {
  static Future<Weather> getWeather(String cityName) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=bbc13211ba9360cc21b63d54ce4d7d07&units=metric'));
    final json = jsonDecode(response.body);

    return Weather.fromJson(json);
  }
}

final weatherProvider = FutureProviderFamily<Weather, String>(
  (ref, cityName) async {
    return ApiTrying.getWeather(cityName);
  },
);

class Weather {
  final String cityName;
  final double temperature;
  final String description;

  Weather({required this.temperature, required this.cityName, required this.description});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'],
      description: json["weather"][0]["description"],
    );
  }
}
