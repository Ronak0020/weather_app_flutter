import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:lottie/lottie.dart";
import "package:weather_app/helper/global_constants.dart";

class HourlyData extends StatefulWidget {
  final bool? selected;
  final Widget? child;
  final int time;
  final double temp;
  const HourlyData({super.key, this.selected = false, this.child, required this.time, required this.temp});

  @override
  State<HourlyData> createState() => _HourlyDataState();
}

class _HourlyDataState extends State<HourlyData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal : mq.width * 0.005),
      child: Container(
        padding: const EdgeInsets.all(5),
        width: mq.width * 0.24,
        height: mq.height * 0.15,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          color: !widget.selected! ? Colors.grey.shade300 : Theme.of(context).highlightColor
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(widget.time * 1000)), style: TextStyle(fontSize: mq.height * 0.013, color: !widget.selected! ? null : Colors.white),),
            Lottie.asset("assets/lottie/cloudy.json", width: mq.width * 0.13),
            Text("${widget.temp.round()}°", style: TextStyle(fontSize: mq.height * 0.017, color: !widget.selected! ? null : Colors.white),)
          ],
        ),
      ),
    );
  }
}