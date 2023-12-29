import 'package:flutter/material.dart';
import 'package:flutter_weather_app/controller/global_controller.dart';
import 'package:flutter_weather_app/utils/custom_colors.dart';
import 'package:flutter_weather_app/widgets/comfort_level.dart';
import 'package:flutter_weather_app/widgets/daily_data_forecast.dart';
import 'package:flutter_weather_app/widgets/hourly_data_widget.dart';
import 'package:get/get.dart';

class WeatherDetailScreen extends StatefulWidget {
  const WeatherDetailScreen({Key? key}) : super(key: key);

  @override
  State<WeatherDetailScreen> createState() => _WeatherDetailScreenState();
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff74acd5),
                Color(0xff156baf),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  HourlyDataWidget(
                      weatherDataHourly:
                          globalController.getData().getHourlyWeather()),
                  DailyDataForecast(
                    weatherDataDaily:
                        globalController.getData().getDailyWeather(),
                  ),
                  Container(
                    height: 1,
                    color: CustomColors.dividerLine,
                  ),
                  const SizedBox(height: 10),
                  ComfortLevel(
                      weatherDataCurrent:
                          globalController.getData().getCurrentWeather())
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 1));
  }
}
