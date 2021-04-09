import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:weather_app/models/cities_weather.dart';

class NetworkHelper {
  static const _APIURL = 'api.openweathermap.org';
  static const _APIROUTE = '/data/2.5/group';
  static const urlForWeatherIcon = 'http://openweathermap.org/img/w/';
  static const _APIKEY = 'abae32df2626399b7bb908d1648361b2';
  static const _citiesId =
      '1172451,1174872,1177662,1162015,3117735,1166548,1167528,1169684,1169825,2643743';
  static const _temperatureUnit = 'metric';

  Future<List<CitiesWeather>> fetchCitiesWeather() async {
    var response = await http.get(
      Uri.https(
        _APIURL,
        _APIROUTE,
        {
          'id': _citiesId,
          'units': _temperatureUnit,
          'appid': _APIKEY,
        },
      ),
    );
    if (response.statusCode == 200) {
      List listOfCitiesWeather = jsonDecode(response.body)['list'];
      print(listOfCitiesWeather);
      return listOfCitiesWeather
          .map((json) => CitiesWeather.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to fetch data from API');
    }
  }
}
