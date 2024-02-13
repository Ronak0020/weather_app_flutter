import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:intl/intl.dart";
import "package:lottie/lottie.dart";
import "package:weather_app/components/comfort_levels.dart";
import "package:weather_app/components/forecast_data.dart";
import "package:weather_app/components/hourly_data_card.dart";
import "package:weather_app/controller/global_controller.dart";
import "package:weather_app/helper/global_constants.dart";

import "../components/details_card.dart";
import "../components/header_widget.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController _gController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
          child: Obx(() => _gController.loading().isTrue
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: mq.width * 0.08),
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: mq.height * 0.05),
                        child: HeaderWidget(
                          title: _gController.cityName().value,
                          subtitle: DateFormat.yMMMMd().format(DateTime.now()),
                        ),
                      ),
                      SizedBox(
                        height: mq.height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Lottie.asset(
                              "assets/lottie/cloudy.json", // ----------------------------- CHANGE IT THE ICON
                              width: mq.width * 0.25),
                          Container(
                            height: mq.height * 0.08,
                            width: 1,
                            color: Colors.grey.shade300,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text:
                                  "${_gController.weatherData.value.current!.current.temp.round()}°",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: mq.height * 0.08,
                                  color: Colors.black,
                                  fontFamily: "Montserrat"),
                            ),
                            TextSpan(
                                text: _gController.weatherData.value.current!
                                    .current.condition,
                                style: TextStyle(
                                    fontSize: mq.height * 0.015,
                                    color: Colors.black,
                                    fontFamily: "Montserrat"))
                          ]))
                          // Text("cloudy", style: TextStyle(fontSize: mq.height * 0.013),)
                        ],
                      ),
                      SizedBox(
                        height: mq.height * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DetailCard(detail: "${_gController.weatherData.value.current!.current.windSpeed}km/h", child: Lottie.asset("assets/lottie/wind_speed.json", width: mq.width * 0.08),),
                            DetailCard(detail: "${_gController.weatherData.value.current!.current.humidity}%", child: Lottie.asset("assets/lottie/humidity.json", width: mq.width * 0.08),),
                            DetailCard(detail: "${_gController.weatherData.value.current!.current.cloudy}%", child: Lottie.asset("assets/lottie/clouds.json", width: mq.width * 0.08),),
                          ],
                        ),
                      ),
                      Text("TODAY", textAlign: TextAlign.center, style: TextStyle(fontSize: mq.height * 0.03),),
                      SizedBox(height: mq.height * 0.01,),
                      SizedBox(
                          height: mq.height * 0.17,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _gController.weatherData.value.hourly!.hourly.where((e) => e.time >= (DateTime.now().millisecondsSinceEpoch / 1000)).length > 12 ? 12 : _gController.weatherData.value.hourly!.hourly.where((e) => e.time >= (DateTime.now().millisecondsSinceEpoch / 1000)).length,
                            itemBuilder: (context, index) => HourlyData(
                              selected: index == 0 ? true : false,
                              temp: _gController.weatherData.value.hourly!.hourly.where((e) => e.time >= (DateTime.now().millisecondsSinceEpoch / 1000)).toList()[index].temp,
                              time: _gController.weatherData.value.hourly!.hourly.where((e) => e.time >= (DateTime.now().millisecondsSinceEpoch / 1000)).toList()[index].time,
                            ),
                          )),

                          ForecastData(data: _gController.weatherData.value.daily,),
                          
                          ComfortLevel(weather: _gController.weatherData.value.currentWeather()),
                          SizedBox(height: mq.height * 0.02,),
                          Text("Powered by WeatherApi.com", textAlign: TextAlign.center, style: TextStyle(fontSize: mq.height * 0.013),),
                          SizedBox(height: mq.height * 0.03,)
                    ],
                  ),
                ))),
    );
  }
}
