import 'dart:convert';

import 'package:check/WeatherCurrent/data/data_providers/weather_data_provider.dart';
import 'package:check/WeatherCurrent/data/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider = WeatherDataProvider();

  Future<Weather> getWeather(String location) async {
    final http.Response rawWeather =
        await weatherDataProvider.getRawWeatherData(location);
    final json = await jsonDecode(rawWeather.body);
    final Weather weather = Weather.fromJson(json);
    return weather;
  }
}
