class WeatherDataHourly {
  List<Hourly> hourly;
  WeatherDataHourly({required this.hourly});
  factory WeatherDataHourly.fromJson(Map<String, dynamic> json) =>
      WeatherDataHourly(
          hourly:
              List<Hourly>.from(json["hour"].map((e) => Hourly.fromJson(e))));
}

class Hourly {
  int time;
  double temp;
  double windSpeed;
  String windDirection;
  double pressure;
  int humidity;
  int rainChance;
  double visibility;
  double uv;
  String condition;
  int code;

  Hourly(
      {required this.time,
      required this.temp,
      required this.windSpeed,
      required this.windDirection,
      required this.pressure,
      required this.humidity,
      required this.rainChance,
      required this.visibility,
      required this.uv,
      required this.condition,
      required this.code});

  factory Hourly.fromJson(Map<String, dynamic> data) => Hourly(
      time: data["time_epoch"],
      temp: data["temp_c"],
      windSpeed: data["wind_kph"],
      windDirection: data["wind_dir"],
      pressure: data["pressure_mb"],
      humidity: data["humidity"],
      rainChance: data["chance_of_rain"],
      visibility: data["vis_km"],
      uv: data["uv"],
      condition: data["condition"]["text"],
      code: data["condition"]["code"]);
}
