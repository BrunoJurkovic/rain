import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String city;
  final String temperature;

  const Weather(this.city, this.temperature);

  @override
  List<Object> get props => [city, temperature];
}