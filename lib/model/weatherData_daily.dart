class WeatherDataDaily {
  List<Daily> daily;
  WeatherDataDaily({required this.daily});
  factory WeatherDataDaily.fromJson(Map<String, dynamic> json) =>
      WeatherDataDaily(
          daily:
              List<Daily>.from(json["forecastday"].map((e) => Daily.fromJson(e))));
}

class Daily {
  int date;
  double maxtemp;
  double mintemp;
  double temp;
  double windSpeed;
  int humidity;
  int rainChance;
  double visibility;
  double uv;
  String condition;
  int code;

  Daily(
      {required this.date,
      required this.maxtemp,
      required this.mintemp,
      required this.temp,
      required this.windSpeed,
      required this.humidity,
      required this.rainChance,
      required this.visibility,
      required this.uv,
      required this.condition,
      required this.code});

  factory Daily.fromJson(Map<String, dynamic> data) => Daily(
      date: data["date_epoch"],
      maxtemp: data["day"]["maxtemp_c"],
      mintemp: data["day"]["mintemp_c"],
      temp: data["day"]["avgtemp_c"],
      windSpeed: data["day"]["maxwind_kph"],
      humidity: data["day"]["avghumidity"],
      rainChance: data["day"]["daily_chance_of_rain"],
      visibility: data["day"]["avgvis_km"],
      uv: data["day"]["uv"],
      condition: data["day"]["condition"]["text"],
      code: data["day"]["condition"]["code"]);
}
