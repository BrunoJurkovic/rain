import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rain/data/models/weather.dart';
import 'package:rain/data/repositories/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;

  WeatherBloc(this.repository);

  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    yield WeatherLoading();

    if (event is GetWeather) {
      try {
        final Weather weather = await repository.fetchWeather();
        yield WeatherLoaded(weather);
      } catch (e) {
        yield WeatherError(e.toString());
      }
    }
  }
}
