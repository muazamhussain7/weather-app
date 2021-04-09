import 'package:flutter/material.dart';

Row buildTempRangeRow(String minTemperature, String maxTemperature) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        minTemperature + ' - ' + maxTemperature,
      ),
      Text(
        '°',
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      Text('C'),
    ],
  );
}
