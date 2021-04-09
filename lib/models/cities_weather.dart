class CitiesWeather {
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final String weatherCondition;
  final String cityName;
  final String countryName;
  final String weatherIcon;

  CitiesWeather({
    this.temperature,
    this.minTemperature,
    this.maxTemperature,
    this.weatherCondition,
    this.weatherIcon,
    this.cityName,
    this.countryName,
  });

  factory CitiesWeather.fromJson(Map<String, dynamic> json) {
    return CitiesWeather(
      temperature: json['main']['temp'].toDouble(),
      minTemperature: json['main']['temp_max'].toDouble(),
      maxTemperature: json['main']['temp_min'].toDouble(),
      weatherCondition: json['weather'][0]['main'],
      weatherIcon: json['weather'][0]['icon'],
      cityName: json['name'],
      countryName: json['sys']['country'],
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
          'icon': instance.weatherIcon,
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
