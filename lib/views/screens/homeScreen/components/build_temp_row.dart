import 'package:flutter/material.dart';

Row buildTempRow(String temperature) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        temperature,
        style: const TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        '°',
        style: const TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
      Text(
        'C',
        style: const TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
