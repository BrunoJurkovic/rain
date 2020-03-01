import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rain/bloc/weather_bloc.dart';
import 'package:rain/data/repositories/weather_repo.dart';
import 'package:rain/presentation/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (context) => WeatherBloc(NetworkWeatherRepository()),
        child: HomePage(),
      ),
    );
  }
}


