import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:check/Weather/model/weather_response_model.dart';

class ApiProvider {
  Client client = Client();
  final _baseUrl =
      "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=6c0d5f6d2ca8210194eafbb76b525d93";

  Future<WeatherResponse> fetchLondonWeather() async {
    final response = await client.get(Uri.parse("$_baseUrl"));
    print(response.body.toString());

    if (response.statusCode == 200) {
      return WeatherResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}