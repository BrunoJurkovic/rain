import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String city;
  final double temperature;

  const Weather({this.city, this.temperature});

  factory Weather.fromJson(Map<dynamic, dynamic> map) {
    final double temperature = map['currently']['temperature'];
    return Weather(city: 'Karlovac', temperature: temperature);
  }

  @override
  List<Object> get props => [city, temperature];
}
