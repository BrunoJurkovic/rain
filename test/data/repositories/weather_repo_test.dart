import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:rain/data/models/weather.dart';
import 'package:rain/data/repositories/weather_repo.dart';

import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

main() {
  NetworkWeatherRepository realRepo;
  MockClient client;

  setUp(() {
    client = MockClient();
    realRepo = NetworkWeatherRepository();
  });
  group('fetchWeather', () {
    // final Weather weather = Weather('Karlovac', 14.0);?
    test('Returns Weather', () async {
      when(client.get(
              'https://api.darksky.net/forecast/6f2d3cd55169302d5ed075933792b96b/45.4929,15.5553'))
          .thenAnswer((_) async => http.Response(
              '{   "latitude":45.4929,   "longitude":15.5553,   "timezone":"Europe/Zagreb",   "currently":{      "time":1583081151,      "summary":"Possible Drizzle",      "icon":"rain",      "precipIntensity":0.0058,      "precipProbability":0.28,      "precipType":"rain",      "temperature":54.59,      "apparentTemperature":54.59,      "dewPoint":44.93,      "humidity":0.7,      "pressure":1005.1,      "windSpeed":8.07,      "windGust":26.43,      "windBearing":178,      "cloudCover":1,      "uvIndex":0,      "visibility":10,      "ozone":345.8   }}',
              200));

      expect(await realRepo.fetchWeather(city: 'Karlovac', client: client),
          isA<Weather>());
    });
  });
}
