import "package:flutter/material.dart";
import "package:sleek_circular_slider/sleek_circular_slider.dart";
import "package:weather_app/helper/global_constants.dart";
import "package:weather_app/model/weatherData_current.dart";

class ComfortLevel extends StatefulWidget {
  final WeatherDataCurrent weather;
  const ComfortLevel({super.key, required this.weather});

  @override
  State<ComfortLevel> createState() => _ComfortLevelState();
}

class _ComfortLevelState extends State<ComfortLevel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05, vertical: mq.height * 0.01),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          color: Colors.grey.shade300),
      child: Column(
        children: [
          Text("Comfort Levels", textAlign: TextAlign.center, style: TextStyle(fontSize: mq.height * 0.03),),
          SizedBox(height: mq.height * 0.02,),
          SleekCircularSlider(
            min: 0,
            max: 100,
            initialValue: widget.weather.current.humidity.toDouble(),
            appearance: CircularSliderAppearance(
              size: mq.width * 0.5,
              customColors: CustomSliderColors(
                dotColor: Colors.transparent,
                  trackColor: Theme.of(context).highlightColor.withAlpha(100),
                  progressBarColors: [Theme.of(context).highlightColor, Colors.blue.shade500],
                  gradientStartAngle: 180,
                  gradientEndAngle: 360,
                  shadowColor: Theme.of(context).highlightColor),
                  infoProperties: InfoProperties(
                    bottomLabelText: "Humidity",
                    bottomLabelStyle: TextStyle(fontSize: mq.height * 0.025),
                    mainLabelStyle: TextStyle(fontSize: mq.height * 0.035, fontWeight: FontWeight.bold)
                  )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Feels Like ${widget.weather.current.feelsLike}°"),
              Container(height: mq.height * 0.025, width: 0.5, color: Colors.grey.shade400,),
              Text("Pressure ${widget.weather.current.pressure.round()}mb")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: mq.width * 0.3, child: Text("Wind Speed ${widget.weather.current.windSpeed} km/h", style: TextStyle(fontSize: mq.height * 0.015),)),
              Container(height: mq.height * 0.025, width: 0.5, color: Colors.grey.shade400,),
              SizedBox(width: mq.width * 0.34, child: Text("Wind Dir ${widget.weather.current.windDirection}", style: TextStyle(fontSize: mq.height * 0.015),))
            ],
          ),
          SizedBox(height: mq.height * 0.03,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.1),
            child: Divider(thickness: 0.5, color: Colors.grey.shade400,),
          ),

          SizedBox(height: mq.height * 0.03,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SleekCircularSlider(
            min: 0,
            max: 100,
            initialValue: widget.weather.current.cloudy.toDouble(),
            appearance: CircularSliderAppearance(
              size: mq.width * 0.3,
              customColors: CustomSliderColors(
                dotColor: Colors.transparent,
                  trackColor: Theme.of(context).highlightColor.withAlpha(100),
                  progressBarColors: [Theme.of(context).highlightColor, Colors.blue.shade500],
                  gradientStartAngle: 180,
                  gradientEndAngle: 360,
                  shadowColor: Theme.of(context).highlightColor),
                  infoProperties: InfoProperties(
                    bottomLabelText: "Cloudy",
                    bottomLabelStyle: TextStyle(fontSize: mq.height * 0.018),
                    mainLabelStyle: TextStyle(fontSize: mq.height * 0.023, fontWeight: FontWeight.bold)
                  )
            ),
          ),
          Container(height: mq.height * 0.1, width: 0.5, color: Colors.grey.shade400,),
          SleekCircularSlider(
            min: 0,
            max: 11,
            initialValue: widget.weather.current.uv > 11 ? 11 : widget.weather.current.uv,
            appearance: CircularSliderAppearance(
              size: mq.width * 0.3,
              customColors: CustomSliderColors(
                dotColor: Colors.transparent,
                  trackColor: Theme.of(context).highlightColor.withAlpha(100),
                  progressBarColors: [Colors.green, Colors.yellow, Colors.orange, Colors.red],
                  gradientStartAngle: 180,
                  gradientEndAngle: 360,
                  shadowColor: Theme.of(context).highlightColor),
                  infoProperties: InfoProperties(
                    bottomLabelText: "UV Index",
                    bottomLabelStyle: TextStyle(fontSize: mq.height * 0.018),
                    mainLabelStyle: TextStyle(fontSize: mq.height * 0.023, fontWeight: FontWeight.bold)
                  )
            ),
          ),
            ],
          ),
        ],
      ),
    );
  }
}
