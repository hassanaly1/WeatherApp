import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_app/model/weather_data.dart';
import 'package:flutter_weather_app/model/weather_data_current.dart';
import 'package:flutter_weather_app/model/weather_data_daily.dart';
import 'package:flutter_weather_app/model/weather_data_hourly.dart';
import 'package:flutter_weather_app/utils/api_url.dart';
import 'package:http/http.dart' as http;

class FetchWeatherAPI {
  WeatherData? weatherData;

  Future<WeatherData?> processData(double lat, double lon) async {
    try {
      var response = await http.get(Uri.parse(apiURL(lat, lon)));

      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body);
        weatherData = WeatherData(
          WeatherDataCurrent.fromJson(jsonString),
          WeatherDataHourly.fromJson(jsonString),
          WeatherDataDaily.fromJson(jsonString),
        );
        return weatherData;
      } else {
        debugPrint(
            'Failed to fetch weather data. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Error fetching weather data: $e');
      return null;
    }
  }
}
