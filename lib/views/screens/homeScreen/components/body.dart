import 'package:flutter/material.dart';

import 'package:weather_app/models/cities_weather.dart';
import 'package:weather_app/controllers/network_helper.dart';
import 'build_weather_condition_row.dart';
import 'build_temp_range_row.dart';
import 'build_temp_row.dart';
import 'build_drop_down_items.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<DropdownMenuItem<CitiesWeather>> dropDownMenuItems = [];
  CitiesWeather selectedCity;
  var isLoading = true;

  @override
  void initState() {
    super.initState();
    NetworkHelper().fetchCitiesWeather().then((listOfCitiesWeather) {
      dropDownMenuItems = buildDropDownItems(listOfCitiesWeather);
      selectedCity = dropDownMenuItems[0].value;
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading
          ? CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTempRow(selectedCity.temperature.toInt().toString()),
                const SizedBox(
                  height: 8.0,
                ),
                buildTempRangeRow(
                  selectedCity.minTemperature.toString(),
                  selectedCity.maxTemperature.toString(),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                buildWeatherConditionRow(
                  selectedCity.weatherCondition,
                  selectedCity.weatherIcon,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    items: dropDownMenuItems,
                    value: selectedCity,
                    onChanged: (CitiesWeather value) {
                      setState(() {
                        selectedCity = value;
                      });
                    },
                  ),
                ),
                Text(selectedCity.countryName),
              ],
            ),
    );
  }
}
