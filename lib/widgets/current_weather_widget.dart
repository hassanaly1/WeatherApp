import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/weather_data_current.dart';
import 'package:flutter_weather_app/utils/custom_colors.dart';
import 'package:flutter_weather_app/widgets/custom_text_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        temperatureAreaWidget(),
        const SizedBox(height: 20),
        currentWeatherMoreDetailsWidget(),
      ],
    );
  }

  Widget currentWeatherMoreDetailsWidget() {
    Widget weatherDetail(String icon, String label, String value) {
      return Column(
        children: [
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CustomColors.cardColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset("assets/icons/$icon.png"),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            width: 60,
            child: Column(
              children: [
                CustomTextWidget(
                  text: label,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                  textAlign: TextAlign.center,
                ),
                CustomTextWidget(
                  text: value,
                  fontSize: 12.0,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            weatherDetail("windspeed", "Wind Speed",
                "${weatherDataCurrent.current.windSpeed}km/h"),
            weatherDetail(
                "clouds", "Clouds", "${weatherDataCurrent.current.clouds}%"),
            weatherDetail("humidity", "Humidity",
                "${weatherDataCurrent.current.humidity}%"),
          ],
        ),
      ],
    );
  }

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: Colors.black38,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${weatherDataCurrent.current.temp!.toInt()}°",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                  color: CustomColors.textColorBlack,
                ),
              ),
              TextSpan(
                text: "${weatherDataCurrent.current.weather![0].description}",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
