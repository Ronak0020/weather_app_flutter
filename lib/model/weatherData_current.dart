class WeatherDataCurrent {
  final Current current;
  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(current: Current.fromJson(json['current']));
}

class Current {
  int time;
  double temp;
  double feelsLike;
  double windSpeed;
  String windDirection;
  double pressure;
  int humidity;
  int cloudy;
  double visibility;
  double uv;
  String condition;
  int code;

  Current(
      {required this.time,
      required this.temp,
      required this.feelsLike,
      required this.windSpeed,
      required this.windDirection,
      required this.pressure,
      required this.humidity,
      required this.cloudy,
      required this.visibility,
      required this.uv,
      required this.condition,
      required this.code});

  factory Current.fromJson(Map<String, dynamic> data) => Current(
      time: data["last_updated_epoch"],
      temp: data["temp_c"],
      feelsLike: data["feelslike_c"],
      windSpeed: data["wind_kph"],
      windDirection: data["wind_dir"],
      pressure: data["pressure_mb"],
      humidity: data["humidity"],
      cloudy: data["cloud"],
      visibility: data["vis_km"],
      uv: data["uv"],
      condition: data["condition"]["text"],
      code: data["condition"]["code"]);
}
