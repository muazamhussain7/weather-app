class CitiesWeather {
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final String weatherCondition;
  final String cityName;
  final String countryName;

  CitiesWeather({
    this.temperature,
    this.minTemperature,
    this.maxTemperature,
    this.weatherCondition,
    this.cityName,
    this.countryName,
  });

  factory CitiesWeather.fromJson(Map<String, dynamic> json) {
    return CitiesWeather(
      temperature: json['main']['temp'] as double,
      minTemperature: json['main']['temp_max'] as double,
      maxTemperature: json['main']['temp_min'] as double,
      weatherCondition: json['weather'][0]['main'] as String,
      cityName: json['name'] as String,
      countryName: json['sys']['country'] as String,
    );
  }

  Map<String, dynamic> toJson(CitiesWeather instance) {
    return <String, dynamic>{
      'sys': {
        'country': instance.countryName,
      },
      'weather': [
        {
          'main': instance.weatherCondition,
        }
      ],
      'main': {
        'temp': instance.temperature,
        'temp_min': instance.minTemperature,
        'temp_max': instance.maxTemperature,
      },
      'name': instance.cityName,
    };
  }
}
