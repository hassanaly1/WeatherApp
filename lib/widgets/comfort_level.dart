import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/weather_data_current.dart';
import 'package:flutter_weather_app/utils/custom_colors.dart';
import 'package:flutter_weather_app/widgets/custom_text_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const ComfortLevel({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget customText(String label, String value) {
      return RichText(
        text: TextSpan(children: [
          TextSpan(
            text: label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              height: 0.8,
              color: CustomColors.textColorBlack,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              height: 0.8,
              color: CustomColors.textColorBlack,
              fontWeight: FontWeight.w700,
            ),
          ),
        ]),
      );
    }

    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child: CustomTextWidget(
            text: "Comfort Level",
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                      handlerSize: 0,
                      trackWidth: 10,
                      progressBarWidth: 12,
                    ),
                    infoProperties: InfoProperties(
                      bottomLabelText: "Humidity",
                      bottomLabelStyle: GoogleFonts.poppins(
                        letterSpacing: 0.1,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),
                    animationEnabled: true,
                    size: 140,
                    customColors: CustomSliderColors(
                      hideShadow: true,
                      trackColor:
                          CustomColors.firstGradientColor.withAlpha(100),
                      progressBarColors: [
                        Colors.white.withOpacity(0.2),
                        Colors.blueAccent.shade100,
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText("Feels Like: ",
                      "${weatherDataCurrent.current.feelsLike}"),
                  Container(
                    height: 25,
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    width: 1,
                    color: CustomColors.dividerLine,
                  ),
                  customText(
                      "UV Index ", "${weatherDataCurrent.current.uvIndex}"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
