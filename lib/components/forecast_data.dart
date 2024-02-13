import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:lottie/lottie.dart";
import "package:weather_app/helper/global_constants.dart";
import "package:weather_app/model/weatherData_daily.dart";

class ForecastData extends StatefulWidget {
  final WeatherDataDaily? data;
  const ForecastData({super.key, this.data});

  @override
  State<ForecastData> createState() => _ForecastDataState();
}

class _ForecastDataState extends State<ForecastData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: mq.height * 0.04,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: mq.height * 0.01, horizontal: mq.width * 0.08),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          color: Colors.grey.shade300
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Weather Forecast", style: TextStyle(fontSize: mq.height * 0.023, fontWeight: FontWeight.bold),),
            SizedBox(height: mq.height * 0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: mq.width * 0.1, child: Text(DateFormat.E().format(DateTime.fromMillisecondsSinceEpoch(widget.data!.daily[0].date * 1000)))),
                Lottie.asset("assets/lottie/clouds.json", width: mq.width * 0.08),
                SizedBox(width: mq.width * 0.2, child: Text("${widget.data!.daily[0].maxtemp}°/${widget.data!.daily[0].mintemp}°"))
              ],
            ),
            Divider(thickness: 1, color: Colors.grey[350],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: mq.width * 0.1, child: Text(DateFormat.E().format(DateTime.fromMillisecondsSinceEpoch(widget.data!.daily[1].date * 1000)))),
                Lottie.asset("assets/lottie/clouds.json", width: mq.width * 0.08),
                SizedBox(width: mq.width * 0.2, child: Text("${widget.data!.daily[1].maxtemp}°/${widget.data!.daily[1].mintemp}°"))
              ],
            ),
            Divider(thickness: 1, color: Colors.grey[350],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: mq.width * 0.1, child: Text(DateFormat.E().format(DateTime.fromMillisecondsSinceEpoch(widget.data!.daily[2].date * 1000)))),
                Lottie.asset("assets/lottie/clouds.json", width: mq.width * 0.08),
                SizedBox(width: mq.width * 0.2, child: Text("${widget.data!.daily[2].maxtemp}°/${widget.data!.daily[2].mintemp}°"))
              ],
            ),
            Divider(thickness: 1, color: Colors.grey[350],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: mq.width * 0.1, child: Text(DateFormat.E().format(DateTime.fromMillisecondsSinceEpoch(widget.data!.daily[3].date * 1000)))),
                Lottie.asset("assets/lottie/clouds.json", width: mq.width * 0.08),
                SizedBox(width: mq.width * 0.2, child: Text("${widget.data!.daily[3].maxtemp}°/${widget.data!.daily[3].mintemp}°"))
              ],
            ),
            Divider(thickness: 1, color: Colors.grey[350],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: mq.width * 0.1, child: Text(DateFormat.E().format(DateTime.fromMillisecondsSinceEpoch(widget.data!.daily[4].date * 1000)))),
                Lottie.asset("assets/lottie/clouds.json", width: mq.width * 0.08),
                SizedBox(width: mq.width * 0.2, child: Text("${widget.data!.daily[4].maxtemp}°/${widget.data!.daily[4].mintemp}°"))
              ],
            ),
            Divider(thickness: 1, color: Colors.grey[350],),
          ],
        ),
      ),
    );
  }
}
