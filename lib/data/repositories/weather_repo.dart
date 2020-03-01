import 'dart:convert';

import 'package:rain/data/models/weather.dart';

import 'package:http/http.dart' as http;

abstract class WeatherRepository {
  Future<Weather> fetchWeather();
}

class NetworkWeatherRepository implements WeatherRepository {
  @override
  Future<Weather> fetchWeather({String city, http.Client client}) async {
    try {
      final http.Response response = await client.get(
          'https://api.darksky.net/forecast/6f2d3cd55169302d5ed075933792b96b/45.4929,15.5553');

      final Map<dynamic, dynamic> result = json.decode(response.body);
      final Weather weather = Weather.fromJson(result);
      return weather;
    } catch (e) {
      throw Exception('${e.toString()}');
    }
  }
}
