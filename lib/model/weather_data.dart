import 'package:weather_app/model/weatherData_current.dart';
import 'package:weather_app/model/weatherData_daily.dart';
import 'package:weather_app/model/weatherData_hourly.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;

  WeatherData({this.current, this.hourly, this.daily});

  WeatherDataCurrent currentWeather() => current!;
  WeatherDataHourly hourlyWeather() => hourly!;
  WeatherDataDaily dailyWeather() => daily!;
}