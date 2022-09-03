
import 'package:check/Weather/Api/api_provider.dart';
import 'package:check/Weather/model/weather_response_model.dart';

class Repository {
  ApiProvider appApiProvider = ApiProvider();

  Future<WeatherResponse?> fetchLondonWeather() => appApiProvider.fetchLondonWeather();
}