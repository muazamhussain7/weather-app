import 'package:flutter/material.dart';

import 'package:weather_app/models/cities_weather.dart';

List<DropdownMenuItem<CitiesWeather>> buildDropDownItems(
    List<CitiesWeather> listOfCitiesWeather) {
  List<DropdownMenuItem<CitiesWeather>> dropDownMenuItems = [];
  for (CitiesWeather cityWeather in listOfCitiesWeather) {
    dropDownMenuItems.add(
      DropdownMenuItem(
        value: cityWeather,
        child: Text(cityWeather.cityName),
      ),
    );
  }
  return dropDownMenuItems;
}
