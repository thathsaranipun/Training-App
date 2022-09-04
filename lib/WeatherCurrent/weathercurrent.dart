import 'package:check/WeatherCurrent/business_logic/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/weather_app.dart';


class WeatherCurrent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WeatherBloc()..add(WeatherRequest(cityName: "Galle")),
      child: Scaffold(
        body: WeatherApp(),
      ),
    );
  }
}
