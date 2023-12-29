import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/home_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeScreen(),
      title: "WeatherApp",
      debugShowCheckedModeBanner: false,
    );
  }
}
