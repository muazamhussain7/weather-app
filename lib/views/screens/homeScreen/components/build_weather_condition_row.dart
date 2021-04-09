import 'package:flutter/material.dart';

import 'package:weather_app/controllers/network_helper.dart';

Row buildWeatherConditionRow(String weatherCondition, String weatherIcon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        weatherCondition,
        style: const TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
      Image.network(
        NetworkHelper.urlForWeatherIcon + '$weatherIcon.png',
        // 'http://openweathermap.org/img/w/${selectedCity.weatherIcon}.png',
      ),
    ],
  );
}
