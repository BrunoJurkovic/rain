import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rain/bloc/weather_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D3047),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, WeatherState state) {
          if (state is WeatherLoading) {
            return CircularProgressIndicator();
          } else if (state is WeatherInitial) {
            // enter text
          } else if (state is WeatherLoaded) {
            // display weather
          } else if (state is WeatherError) {
            // do weather error
          }
        },
      ),
    );
  }
}