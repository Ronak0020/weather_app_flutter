import 'dart:convert';
import 'dart:io';

import 'package:weather_app/helper/global_constants.dart';
import 'package:weather_app/model/weatherData_current.dart';
import 'package:weather_app/model/weatherData_daily.dart';
import 'package:weather_app/model/weatherData_hourly.dart';
import 'package:weather_app/model/weather_data.dart';
import "package:http/http.dart" as http;

class API {
  WeatherData? weatherData;

  Future<WeatherData> fetchData(String location) async {
    var response = await http.get(
        Uri.parse(
            "https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$location&days=3&aqi=yes&alerts=yes"),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    var data = jsonDecode(response.body);
    weatherData = WeatherData(
        current: WeatherDataCurrent.fromJson(data),
        hourly: WeatherDataHourly.fromJson(data["forecast"]["forecastday"][0]),
        daily: WeatherDataDaily.fromJson(data["forecast"]));
    return weatherData!;
  }
}
