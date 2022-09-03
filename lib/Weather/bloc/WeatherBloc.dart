


import 'package:check/Weather/bloc/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:check/Weather/model/weather_response_model.dart';

class WeatherBloc {
  Repository _repository = Repository();

  final _weatherFetcher = PublishSubject<WeatherResponse>();

  Stream<WeatherResponse> get weather => _weatherFetcher.stream;

  fetchLondonWeather() async {
    WeatherResponse? weatherResponse = await _repository.fetchLondonWeather();
    _weatherFetcher.sink.add(weatherResponse!);
  }

  dispose() {
    _weatherFetcher.close();
  }
}

final weatherBloc = WeatherBloc();