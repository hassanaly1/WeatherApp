import 'package:flutter/material.dart';
import 'package:flutter_weather_app/controller/global_controller.dart';
import 'package:flutter_weather_app/screens/weather_detail_screen.dart';
import 'package:flutter_weather_app/widgets/current_weather_widget.dart';
import 'package:flutter_weather_app/widgets/header_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/clouds.png",
                    height: 200,
                    width: 200,
                  ),
                  const CircularProgressIndicator()
                ],
              ))
            : Center(
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
                  child: RefreshIndicator(
                    edgeOffset: 50,
                    onRefresh: _refresh,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        const SizedBox(height: 20),
                        const HeaderWidget(),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GestureDetector(
                            onTap: () => Get.to(const WeatherDetailScreen(),
                                transition: Transition.rightToLeft),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16.0)),
                              child: CurrentWeatherWidget(
                                weatherDataCurrent: globalController
                                    .getData()
                                    .getCurrentWeather(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
      ),
    );
  }
}

Future<void> _refresh() {
  return Future.delayed(const Duration(seconds: 1));
}
